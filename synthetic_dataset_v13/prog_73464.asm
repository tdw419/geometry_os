; DESCRIPTION: Composite: Creates a red circular shape at (387, 169) with radius 33 then Renders a orange box of size 25x112 starting at (257, 96) then Places a yellow dot at position (338, 164).
; PLAN: r0=387(x), r1=169(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=96(y), r7=25(width), r8=112(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=164(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 169
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 96
LDI r7, 25
LDI r8, 112
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 164
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

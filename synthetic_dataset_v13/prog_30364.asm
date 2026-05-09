; DESCRIPTION: Composite: Draws a purple circle centered at (298, 202) with radius 36 then Renders a purple box of size 63x17 starting at (437, 112) then Places a cyan dot at position (459, 116).
; PLAN: r0=298(x), r1=202(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=112(y), r7=63(width), r8=17(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=459(x), r11=116(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 202
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 112
LDI r7, 63
LDI r8, 17
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 116
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT

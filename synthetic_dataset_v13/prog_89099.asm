; DESCRIPTION: Composite: Draws a black rectangle at (394, 21) with width 64 and height 33 then Places a orange line segment connecting (354, 221) to (378, 253).
; PLAN: r0=394(x), r1=21(y), r2=64(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x1), r6=221(y1), r7=378(x2), r8=253(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 21
LDI r2, 64
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 221
LDI r7, 378
LDI r8, 253
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

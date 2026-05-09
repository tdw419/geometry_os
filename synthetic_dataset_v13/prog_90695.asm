; DESCRIPTION: Composite: Renders a white box of size 90x18 starting at (407, 2) then Places a yellow line segment connecting (2, 7) to (329, 52) then Places a yellow dot at position (302, 102).
; PLAN: r0=407(x), r1=2(y), r2=90(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=7(y1), r7=329(x2), r8=52(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=102(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 2
LDI r2, 90
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 7
LDI r7, 329
LDI r8, 52
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 102
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT

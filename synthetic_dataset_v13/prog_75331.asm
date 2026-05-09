; DESCRIPTION: Composite: Places a magenta circle of radius 78 at center (88, 170) then Places a white line segment connecting (29, 90) to (125, 21) then Places a magenta dot at position (329, 243).
; PLAN: r0=88(x), r1=170(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=90(y1), r7=125(x2), r8=21(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=243(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 170
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 90
LDI r7, 125
LDI r8, 21
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 243
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT

; DESCRIPTION: Composite: Draws a orange line from (473, 46) to (85, 188) then Renders a white disk with center (175, 132) and radius 38.
; PLAN: r0=473(x1), r1=46(y1), r2=85(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=132(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 46
LDI r2, 85
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 132
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

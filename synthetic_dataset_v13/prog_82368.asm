; DESCRIPTION: Composite: Renders a white line between points (357, 209) and (409, 78) then Draws a purple rectangle at (299, 189) with width 89 and height 21.
; PLAN: r0=357(x1), r1=209(y1), r2=409(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=189(y), r7=89(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 209
LDI r2, 409
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 189
LDI r7, 89
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT

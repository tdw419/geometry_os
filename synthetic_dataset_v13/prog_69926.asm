; DESCRIPTION: Composite: Renders a yellow line between points (252, 210) and (39, 84) then Renders a white disk with center (258, 180) and radius 34.
; PLAN: r0=252(x1), r1=210(y1), r2=39(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=180(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 252
LDI r1, 210
LDI r2, 39
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 180
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

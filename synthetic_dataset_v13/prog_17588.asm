; DESCRIPTION: Composite: Places a green line segment connecting (505, 185) to (78, 167) then Places a blue circle of radius 37 at center (466, 143).
; PLAN: r0=505(x1), r1=185(y1), r2=78(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=143(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 505
LDI r1, 185
LDI r2, 78
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 143
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

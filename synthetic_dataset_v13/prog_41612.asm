; DESCRIPTION: Composite: Draws a purple line from (283, 140) to (339, 129) then Places a white circle of radius 35 at center (344, 48).
; PLAN: r0=283(x1), r1=140(y1), r2=339(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=48(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 283
LDI r1, 140
LDI r2, 339
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 48
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

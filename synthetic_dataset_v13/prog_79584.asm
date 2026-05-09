; DESCRIPTION: Composite: Creates a blue circular shape at (383, 60) with radius 22 then Renders a green line between points (200, 117) and (40, 219).
; PLAN: r0=383(x), r1=60(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=117(y1), r7=40(x2), r8=219(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 60
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 117
LDI r7, 40
LDI r8, 219
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

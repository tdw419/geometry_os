; DESCRIPTION: Composite: Renders a black disk with center (277, 124) and radius 74 then Places a purple line segment connecting (23, 127) to (499, 200).
; PLAN: r0=277(x), r1=124(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x1), r6=127(y1), r7=499(x2), r8=200(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 124
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 127
LDI r7, 499
LDI r8, 200
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

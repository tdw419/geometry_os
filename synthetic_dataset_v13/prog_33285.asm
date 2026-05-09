; DESCRIPTION: Places a purple line segment connecting (298, 113) to (424, 220).
; PLAN: r0=298(x1), r1=113(y1), r2=424(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 113
LDI r2, 424
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

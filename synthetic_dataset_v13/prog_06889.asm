; DESCRIPTION: Places a blue line segment connecting (248, 141) to (298, 48).
; PLAN: r0=248(x1), r1=141(y1), r2=298(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 141
LDI r2, 298
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

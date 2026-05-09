; DESCRIPTION: Places a blue line segment connecting (298, 4) to (437, 133).
; PLAN: r0=298(x1), r1=4(y1), r2=437(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 4
LDI r2, 437
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

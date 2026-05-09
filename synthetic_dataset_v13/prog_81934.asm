; DESCRIPTION: Places a blue line segment connecting (315, 135) to (186, 215).
; PLAN: r0=315(x1), r1=135(y1), r2=186(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 135
LDI r2, 186
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

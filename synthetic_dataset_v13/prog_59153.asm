; DESCRIPTION: Places a blue line segment connecting (110, 233) to (352, 215).
; PLAN: r0=110(x1), r1=233(y1), r2=352(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 233
LDI r2, 352
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

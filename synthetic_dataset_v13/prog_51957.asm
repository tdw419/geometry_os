; DESCRIPTION: Places a blue line segment connecting (180, 233) to (336, 50).
; PLAN: r0=180(x1), r1=233(y1), r2=336(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 233
LDI r2, 336
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

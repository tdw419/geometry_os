; DESCRIPTION: Places a orange line segment connecting (186, 230) to (198, 50).
; PLAN: r0=186(x1), r1=230(y1), r2=198(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 230
LDI r2, 198
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

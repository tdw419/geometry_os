; DESCRIPTION: Places a orange line segment connecting (198, 144) to (243, 159).
; PLAN: r0=198(x1), r1=144(y1), r2=243(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 144
LDI r2, 243
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

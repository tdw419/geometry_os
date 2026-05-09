; DESCRIPTION: Draws a blue line from (433, 222) to (395, 52).
; PLAN: r0=433(x1), r1=222(y1), r2=395(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 222
LDI r2, 395
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

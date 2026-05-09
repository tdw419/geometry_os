; DESCRIPTION: Draws a blue line from (80, 30) to (4, 166).
; PLAN: r0=80(x1), r1=30(y1), r2=4(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 30
LDI r2, 4
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

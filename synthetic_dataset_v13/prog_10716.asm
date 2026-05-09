; DESCRIPTION: Draws a blue line from (149, 21) to (434, 198).
; PLAN: r0=149(x1), r1=21(y1), r2=434(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 21
LDI r2, 434
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

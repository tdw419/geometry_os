; DESCRIPTION: Draws a magenta line from (349, 231) to (151, 250).
; PLAN: r0=349(x1), r1=231(y1), r2=151(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 231
LDI r2, 151
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

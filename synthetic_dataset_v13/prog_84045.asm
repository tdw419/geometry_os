; DESCRIPTION: Draws a magenta line from (162, 72) to (503, 198).
; PLAN: r0=162(x1), r1=72(y1), r2=503(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 72
LDI r2, 503
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

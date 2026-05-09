; DESCRIPTION: Draws a magenta line from (456, 212) to (331, 171).
; PLAN: r0=456(x1), r1=212(y1), r2=331(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 212
LDI r2, 331
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

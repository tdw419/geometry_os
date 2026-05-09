; DESCRIPTION: Draws a magenta line from (383, 186) to (503, 78).
; PLAN: r0=383(x1), r1=186(y1), r2=503(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 186
LDI r2, 503
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

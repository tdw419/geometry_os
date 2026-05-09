; DESCRIPTION: Draws a magenta line from (304, 94) to (433, 7).
; PLAN: r0=304(x1), r1=94(y1), r2=433(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 94
LDI r2, 433
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

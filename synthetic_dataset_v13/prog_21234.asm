; DESCRIPTION: Draws a magenta line from (208, 31) to (94, 21).
; PLAN: r0=208(x1), r1=31(y1), r2=94(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 31
LDI r2, 94
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

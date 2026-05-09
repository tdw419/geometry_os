; DESCRIPTION: Draws a magenta line from (34, 169) to (164, 213).
; PLAN: r0=34(x1), r1=169(y1), r2=164(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 169
LDI r2, 164
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

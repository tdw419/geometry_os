; DESCRIPTION: Draws a magenta line from (297, 48) to (65, 202).
; PLAN: r0=297(x1), r1=48(y1), r2=65(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 48
LDI r2, 65
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

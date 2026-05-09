; DESCRIPTION: Draws a magenta line from (8, 107) to (176, 202).
; PLAN: r0=8(x1), r1=107(y1), r2=176(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 107
LDI r2, 176
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

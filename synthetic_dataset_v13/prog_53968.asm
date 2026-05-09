; DESCRIPTION: Draws a magenta line from (413, 65) to (249, 243).
; PLAN: r0=413(x1), r1=65(y1), r2=249(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 65
LDI r2, 249
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (249, 12) to (180, 30).
; PLAN: r0=249(x1), r1=12(y1), r2=180(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 12
LDI r2, 180
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

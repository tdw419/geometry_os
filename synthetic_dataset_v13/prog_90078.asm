; DESCRIPTION: Draws a magenta line from (211, 36) to (213, 16).
; PLAN: r0=211(x1), r1=36(y1), r2=213(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 36
LDI r2, 213
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

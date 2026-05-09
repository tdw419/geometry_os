; DESCRIPTION: Draws a green line from (216, 185) to (54, 177).
; PLAN: r0=216(x1), r1=185(y1), r2=54(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 185
LDI r2, 54
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

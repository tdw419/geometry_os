; DESCRIPTION: Draws a magenta line from (324, 233) to (507, 196).
; PLAN: r0=324(x1), r1=233(y1), r2=507(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 233
LDI r2, 507
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

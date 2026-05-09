; DESCRIPTION: Draws a green line from (64, 185) to (200, 172).
; PLAN: r0=64(x1), r1=185(y1), r2=200(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 185
LDI r2, 200
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

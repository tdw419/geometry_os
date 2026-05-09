; DESCRIPTION: Draws a blue line from (27, 179) to (214, 98).
; PLAN: r0=27(x1), r1=179(y1), r2=214(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 179
LDI r2, 214
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

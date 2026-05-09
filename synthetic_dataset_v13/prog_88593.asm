; DESCRIPTION: Draws a blue line from (214, 54) to (128, 148).
; PLAN: r0=214(x1), r1=54(y1), r2=128(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 54
LDI r2, 128
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (412, 244) to (120, 96).
; PLAN: r0=412(x1), r1=244(y1), r2=120(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 244
LDI r2, 120
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

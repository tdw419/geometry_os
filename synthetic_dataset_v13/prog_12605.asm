; DESCRIPTION: Draws a blue line from (189, 177) to (173, 62).
; PLAN: r0=189(x1), r1=177(y1), r2=173(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 177
LDI r2, 173
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

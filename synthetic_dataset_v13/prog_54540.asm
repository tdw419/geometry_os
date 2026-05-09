; DESCRIPTION: Draws a blue line from (423, 64) to (173, 199).
; PLAN: r0=423(x1), r1=64(y1), r2=173(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 64
LDI r2, 173
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

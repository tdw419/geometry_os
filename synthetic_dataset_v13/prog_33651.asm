; DESCRIPTION: Places a green line segment connecting (121, 199) to (173, 181).
; PLAN: r0=121(x1), r1=199(y1), r2=173(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 199
LDI r2, 173
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

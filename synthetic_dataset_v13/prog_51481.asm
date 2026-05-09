; DESCRIPTION: Draws a purple line from (105, 136) to (173, 242).
; PLAN: r0=105(x1), r1=136(y1), r2=173(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 136
LDI r2, 173
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

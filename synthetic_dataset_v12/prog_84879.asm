; DESCRIPTION: Draws a blue line from (38, 109) to (173, 138).
; PLAN: r0=38(x1), r1=109(y1), r2=173(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 109
LDI r2, 173
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black line segment connecting (330, 212) to (173, 159).
; PLAN: r0=330(x1), r1=212(y1), r2=173(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 212
LDI r2, 173
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

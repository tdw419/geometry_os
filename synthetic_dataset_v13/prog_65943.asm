; DESCRIPTION: Places a yellow line segment connecting (173, 165) to (301, 206).
; PLAN: r0=173(x1), r1=165(y1), r2=301(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 165
LDI r2, 301
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

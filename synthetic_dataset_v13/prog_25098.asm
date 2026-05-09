; DESCRIPTION: Draws a green line from (173, 218) to (226, 252).
; PLAN: r0=173(x1), r1=218(y1), r2=226(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 218
LDI r2, 226
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

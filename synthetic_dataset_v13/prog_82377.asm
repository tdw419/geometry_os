; DESCRIPTION: Draws a green line from (96, 96) to (234, 227).
; PLAN: r0=96(x1), r1=96(y1), r2=234(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 96
LDI r2, 234
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (269, 226) to (236, 43).
; PLAN: r0=269(x1), r1=226(y1), r2=236(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 226
LDI r2, 236
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

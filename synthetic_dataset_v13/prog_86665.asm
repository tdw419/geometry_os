; DESCRIPTION: Places a yellow line segment connecting (236, 241) to (1, 213).
; PLAN: r0=236(x1), r1=241(y1), r2=1(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 241
LDI r2, 1
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

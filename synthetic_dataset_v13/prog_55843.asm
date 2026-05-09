; DESCRIPTION: Places a green line segment connecting (234, 166) to (236, 172).
; PLAN: r0=234(x1), r1=166(y1), r2=236(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 166
LDI r2, 236
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

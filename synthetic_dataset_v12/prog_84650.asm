; DESCRIPTION: Draws a yellow line from (407, 33) to (356, 191).
; PLAN: r0=407(x1), r1=33(y1), r2=356(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 33
LDI r2, 356
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

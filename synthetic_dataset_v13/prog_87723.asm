; DESCRIPTION: Draws a green line from (175, 137) to (234, 69).
; PLAN: r0=175(x1), r1=137(y1), r2=234(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 137
LDI r2, 234
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

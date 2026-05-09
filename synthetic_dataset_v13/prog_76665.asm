; DESCRIPTION: Renders a green line between points (189, 153) and (234, 13).
; PLAN: r0=189(x1), r1=153(y1), r2=234(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 153
LDI r2, 234
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

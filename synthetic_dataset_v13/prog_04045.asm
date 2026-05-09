; DESCRIPTION: Renders a green line between points (209, 191) and (234, 115).
; PLAN: r0=209(x1), r1=191(y1), r2=234(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 191
LDI r2, 234
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (350, 191) and (13, 124).
; PLAN: r0=350(x1), r1=191(y1), r2=13(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 191
LDI r2, 13
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

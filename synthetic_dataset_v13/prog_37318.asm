; DESCRIPTION: Renders a white line between points (209, 191) and (73, 99).
; PLAN: r0=209(x1), r1=191(y1), r2=73(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 191
LDI r2, 73
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

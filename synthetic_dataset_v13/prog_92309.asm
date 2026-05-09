; DESCRIPTION: Renders a white line between points (236, 99) and (108, 124).
; PLAN: r0=236(x1), r1=99(y1), r2=108(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 99
LDI r2, 108
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

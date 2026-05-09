; DESCRIPTION: Renders a blue line between points (77, 209) and (504, 76).
; PLAN: r0=77(x1), r1=209(y1), r2=504(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 209
LDI r2, 504
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

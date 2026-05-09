; DESCRIPTION: Renders a blue line between points (166, 45) and (291, 13).
; PLAN: r0=166(x1), r1=45(y1), r2=291(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 45
LDI r2, 291
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

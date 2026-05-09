; DESCRIPTION: Renders a green line between points (388, 249) and (40, 69).
; PLAN: r0=388(x1), r1=249(y1), r2=40(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 249
LDI r2, 40
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

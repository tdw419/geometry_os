; DESCRIPTION: Renders a black line between points (264, 210) and (102, 249).
; PLAN: r0=264(x1), r1=210(y1), r2=102(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 210
LDI r2, 102
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

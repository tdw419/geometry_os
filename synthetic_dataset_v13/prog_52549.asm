; DESCRIPTION: Renders a black line between points (187, 163) and (49, 249).
; PLAN: r0=187(x1), r1=163(y1), r2=49(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 163
LDI r2, 49
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

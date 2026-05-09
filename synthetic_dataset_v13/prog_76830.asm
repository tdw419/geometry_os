; DESCRIPTION: Renders a black line between points (393, 65) and (274, 187).
; PLAN: r0=393(x1), r1=65(y1), r2=274(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 65
LDI r2, 274
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

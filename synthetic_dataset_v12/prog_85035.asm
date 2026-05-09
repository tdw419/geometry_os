; DESCRIPTION: Renders a black line between points (455, 85) and (166, 27).
; PLAN: r0=455(x1), r1=85(y1), r2=166(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 85
LDI r2, 166
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

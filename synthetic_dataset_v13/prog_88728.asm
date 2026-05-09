; DESCRIPTION: Renders a black line between points (475, 187) and (23, 93).
; PLAN: r0=475(x1), r1=187(y1), r2=23(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 187
LDI r2, 23
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

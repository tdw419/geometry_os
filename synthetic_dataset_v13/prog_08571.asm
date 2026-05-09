; DESCRIPTION: Renders a black line between points (468, 85) and (479, 140).
; PLAN: r0=468(x1), r1=85(y1), r2=479(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 85
LDI r2, 479
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

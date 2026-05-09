; DESCRIPTION: Renders a cyan line between points (291, 172) and (483, 7).
; PLAN: r0=291(x1), r1=172(y1), r2=483(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 172
LDI r2, 483
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

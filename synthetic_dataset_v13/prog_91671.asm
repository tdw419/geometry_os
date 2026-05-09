; DESCRIPTION: Renders a cyan line between points (483, 183) and (7, 209).
; PLAN: r0=483(x1), r1=183(y1), r2=7(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 183
LDI r2, 7
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

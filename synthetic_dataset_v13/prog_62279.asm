; DESCRIPTION: Renders a cyan line between points (334, 148) and (467, 71).
; PLAN: r0=334(x1), r1=148(y1), r2=467(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 148
LDI r2, 467
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

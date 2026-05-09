; DESCRIPTION: Renders a cyan line between points (261, 44) and (355, 75).
; PLAN: r0=261(x1), r1=44(y1), r2=355(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 44
LDI r2, 355
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

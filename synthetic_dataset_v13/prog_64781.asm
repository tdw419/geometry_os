; DESCRIPTION: Renders a cyan line between points (311, 65) and (428, 232).
; PLAN: r0=311(x1), r1=65(y1), r2=428(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 65
LDI r2, 428
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (139, 174) to (467, 123).
; PLAN: r0=139(x1), r1=174(y1), r2=467(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 174
LDI r2, 467
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (483, 158) to (367, 76).
; PLAN: r0=483(x1), r1=158(y1), r2=367(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 158
LDI r2, 367
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

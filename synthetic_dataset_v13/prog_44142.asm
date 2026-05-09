; DESCRIPTION: Draws a cyan line from (452, 138) to (139, 99).
; PLAN: r0=452(x1), r1=138(y1), r2=139(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 138
LDI r2, 139
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

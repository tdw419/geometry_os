; DESCRIPTION: Renders a cyan line between points (115, 251) and (212, 249).
; PLAN: r0=115(x1), r1=251(y1), r2=212(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 251
LDI r2, 212
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

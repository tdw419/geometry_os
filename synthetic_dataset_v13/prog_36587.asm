; DESCRIPTION: Draws a cyan line from (93, 3) to (295, 66).
; PLAN: r0=93(x1), r1=3(y1), r2=295(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 3
LDI r2, 295
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

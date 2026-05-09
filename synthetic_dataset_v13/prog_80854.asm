; DESCRIPTION: Draws a cyan line from (150, 87) to (158, 251).
; PLAN: r0=150(x1), r1=87(y1), r2=158(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 87
LDI r2, 158
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

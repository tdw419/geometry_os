; DESCRIPTION: Draws a cyan line from (466, 150) to (163, 251).
; PLAN: r0=466(x1), r1=150(y1), r2=163(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 150
LDI r2, 163
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (484, 137) to (425, 63).
; PLAN: r0=484(x1), r1=137(y1), r2=425(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 137
LDI r2, 425
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

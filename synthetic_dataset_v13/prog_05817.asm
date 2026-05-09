; DESCRIPTION: Draws a cyan line from (115, 18) to (66, 163).
; PLAN: r0=115(x1), r1=18(y1), r2=66(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 18
LDI r2, 66
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

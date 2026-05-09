; DESCRIPTION: Draws a cyan line from (289, 245) to (106, 97).
; PLAN: r0=289(x1), r1=245(y1), r2=106(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 245
LDI r2, 106
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

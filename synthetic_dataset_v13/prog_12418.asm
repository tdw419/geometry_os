; DESCRIPTION: Draws a cyan line from (145, 40) to (99, 245).
; PLAN: r0=145(x1), r1=40(y1), r2=99(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 40
LDI r2, 99
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

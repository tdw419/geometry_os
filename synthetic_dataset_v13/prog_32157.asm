; DESCRIPTION: Draws a red line from (264, 66) to (66, 99).
; PLAN: r0=264(x1), r1=66(y1), r2=66(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 66
LDI r2, 66
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (144, 186) to (312, 75).
; PLAN: r0=144(x1), r1=186(y1), r2=312(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 186
LDI r2, 312
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

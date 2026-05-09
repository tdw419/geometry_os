; DESCRIPTION: Draws a green line from (145, 39) to (229, 170).
; PLAN: r0=145(x1), r1=39(y1), r2=229(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 39
LDI r2, 229
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

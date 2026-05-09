; DESCRIPTION: Draws a yellow line from (335, 245) to (187, 206).
; PLAN: r0=335(x1), r1=245(y1), r2=187(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 245
LDI r2, 187
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

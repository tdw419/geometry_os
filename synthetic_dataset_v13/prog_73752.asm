; DESCRIPTION: Draws a yellow line from (202, 12) to (68, 211).
; PLAN: r0=202(x1), r1=12(y1), r2=68(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 12
LDI r2, 68
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

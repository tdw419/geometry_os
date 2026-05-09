; DESCRIPTION: Draws a yellow line from (405, 71) to (68, 35).
; PLAN: r0=405(x1), r1=71(y1), r2=68(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 71
LDI r2, 68
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

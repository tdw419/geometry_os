; DESCRIPTION: Draws a green line from (369, 191) to (139, 50).
; PLAN: r0=369(x1), r1=191(y1), r2=139(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 191
LDI r2, 139
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

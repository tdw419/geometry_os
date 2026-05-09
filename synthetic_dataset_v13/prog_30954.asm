; DESCRIPTION: Draws a blue line from (308, 182) to (305, 245).
; PLAN: r0=308(x1), r1=182(y1), r2=305(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 182
LDI r2, 305
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

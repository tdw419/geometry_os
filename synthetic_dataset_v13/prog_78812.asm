; DESCRIPTION: Draws a cyan line from (116, 198) to (120, 245).
; PLAN: r0=116(x1), r1=198(y1), r2=120(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 198
LDI r2, 120
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

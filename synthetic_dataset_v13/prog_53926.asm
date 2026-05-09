; DESCRIPTION: Draws a red line from (376, 48) to (0, 108).
; PLAN: r0=376(x1), r1=48(y1), r2=0(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 48
LDI r2, 0
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

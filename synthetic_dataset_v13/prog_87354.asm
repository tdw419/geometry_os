; DESCRIPTION: Draws a red line from (317, 245) to (22, 83).
; PLAN: r0=317(x1), r1=245(y1), r2=22(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 245
LDI r2, 22
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red line from (249, 202) to (139, 16).
; PLAN: r0=249(x1), r1=202(y1), r2=139(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 202
LDI r2, 139
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

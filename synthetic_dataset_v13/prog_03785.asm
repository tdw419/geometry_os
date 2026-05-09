; DESCRIPTION: Renders a red line between points (361, 184) and (154, 26).
; PLAN: r0=361(x1), r1=184(y1), r2=154(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 184
LDI r2, 154
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

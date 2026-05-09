; DESCRIPTION: Renders a red line between points (307, 206) and (363, 123).
; PLAN: r0=307(x1), r1=206(y1), r2=363(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 206
LDI r2, 363
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

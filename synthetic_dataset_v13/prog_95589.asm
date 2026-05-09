; DESCRIPTION: Renders a red line between points (9, 4) and (167, 208).
; PLAN: r0=9(x1), r1=4(y1), r2=167(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 4
LDI r2, 167
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

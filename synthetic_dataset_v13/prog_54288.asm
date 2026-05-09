; DESCRIPTION: Renders a red line between points (45, 129) and (316, 27).
; PLAN: r0=45(x1), r1=129(y1), r2=316(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 129
LDI r2, 316
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (306, 215) and (45, 176).
; PLAN: r0=306(x1), r1=215(y1), r2=45(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 215
LDI r2, 45
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

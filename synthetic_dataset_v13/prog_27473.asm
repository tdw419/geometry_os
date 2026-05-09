; DESCRIPTION: Renders a black line between points (510, 246) and (306, 160).
; PLAN: r0=510(x1), r1=246(y1), r2=306(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 246
LDI r2, 306
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

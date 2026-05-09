; DESCRIPTION: Renders a red line between points (74, 43) and (393, 222).
; PLAN: r0=74(x1), r1=43(y1), r2=393(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 43
LDI r2, 393
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (208, 223) and (184, 65).
; PLAN: r0=208(x1), r1=223(y1), r2=184(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 223
LDI r2, 184
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

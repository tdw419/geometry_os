; DESCRIPTION: Renders a red line between points (244, 21) and (265, 144).
; PLAN: r0=244(x1), r1=21(y1), r2=265(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 21
LDI r2, 265
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (178, 83) and (82, 63).
; PLAN: r0=178(x1), r1=83(y1), r2=82(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 83
LDI r2, 82
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

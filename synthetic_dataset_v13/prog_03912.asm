; DESCRIPTION: Renders a red line between points (178, 32) and (454, 2).
; PLAN: r0=178(x1), r1=32(y1), r2=454(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 32
LDI r2, 454
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

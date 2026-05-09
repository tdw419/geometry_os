; DESCRIPTION: Renders a red line between points (257, 250) and (416, 16).
; PLAN: r0=257(x1), r1=250(y1), r2=416(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 250
LDI r2, 416
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

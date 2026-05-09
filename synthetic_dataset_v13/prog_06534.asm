; DESCRIPTION: Renders a orange line between points (507, 209) and (128, 93).
; PLAN: r0=507(x1), r1=209(y1), r2=128(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 209
LDI r2, 128
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

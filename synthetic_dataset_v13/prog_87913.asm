; DESCRIPTION: Renders a orange line between points (157, 173) and (396, 226).
; PLAN: r0=157(x1), r1=173(y1), r2=396(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 173
LDI r2, 396
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

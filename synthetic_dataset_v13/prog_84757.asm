; DESCRIPTION: Renders a orange line between points (140, 143) and (168, 13).
; PLAN: r0=140(x1), r1=143(y1), r2=168(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 143
LDI r2, 168
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

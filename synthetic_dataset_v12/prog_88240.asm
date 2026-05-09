; DESCRIPTION: Renders a orange line between points (168, 202) and (320, 217).
; PLAN: r0=168(x1), r1=202(y1), r2=320(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 202
LDI r2, 320
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line between points (173, 82) and (194, 32).
; PLAN: r0=173(x1), r1=82(y1), r2=194(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 82
LDI r2, 194
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

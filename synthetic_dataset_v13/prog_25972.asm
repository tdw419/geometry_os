; DESCRIPTION: Renders a orange line between points (502, 157) and (73, 24).
; PLAN: r0=502(x1), r1=157(y1), r2=73(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 157
LDI r2, 73
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

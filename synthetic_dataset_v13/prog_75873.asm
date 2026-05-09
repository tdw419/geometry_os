; DESCRIPTION: Renders a orange line between points (221, 220) and (384, 157).
; PLAN: r0=221(x1), r1=220(y1), r2=384(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 220
LDI r2, 384
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

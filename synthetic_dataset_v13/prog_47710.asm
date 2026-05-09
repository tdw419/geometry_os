; DESCRIPTION: Renders a orange line between points (195, 151) and (102, 197).
; PLAN: r0=195(x1), r1=151(y1), r2=102(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 151
LDI r2, 102
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

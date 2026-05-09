; DESCRIPTION: Renders a orange line between points (282, 94) and (57, 213).
; PLAN: r0=282(x1), r1=94(y1), r2=57(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 94
LDI r2, 57
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

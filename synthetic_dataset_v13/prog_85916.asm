; DESCRIPTION: Renders a orange line between points (36, 111) and (457, 128).
; PLAN: r0=36(x1), r1=111(y1), r2=457(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 111
LDI r2, 457
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

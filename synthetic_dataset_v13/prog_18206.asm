; DESCRIPTION: Renders a orange line between points (381, 75) and (502, 192).
; PLAN: r0=381(x1), r1=75(y1), r2=502(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 75
LDI r2, 502
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

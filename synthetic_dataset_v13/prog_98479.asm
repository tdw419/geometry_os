; DESCRIPTION: Renders a orange line between points (502, 137) and (468, 82).
; PLAN: r0=502(x1), r1=137(y1), r2=468(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 137
LDI r2, 468
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

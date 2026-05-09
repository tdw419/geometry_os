; DESCRIPTION: Renders a white line between points (162, 56) and (509, 143).
; PLAN: r0=162(x1), r1=56(y1), r2=509(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 56
LDI r2, 509
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

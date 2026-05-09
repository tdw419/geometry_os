; DESCRIPTION: Renders a white line between points (110, 63) and (281, 55).
; PLAN: r0=110(x1), r1=63(y1), r2=281(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 63
LDI r2, 281
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

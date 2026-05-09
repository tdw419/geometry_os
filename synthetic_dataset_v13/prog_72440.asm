; DESCRIPTION: Renders a white line between points (95, 99) and (270, 128).
; PLAN: r0=95(x1), r1=99(y1), r2=270(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 99
LDI r2, 270
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

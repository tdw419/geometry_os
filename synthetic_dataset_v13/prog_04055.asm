; DESCRIPTION: Renders a orange line between points (242, 192) and (143, 220).
; PLAN: r0=242(x1), r1=192(y1), r2=143(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 192
LDI r2, 143
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

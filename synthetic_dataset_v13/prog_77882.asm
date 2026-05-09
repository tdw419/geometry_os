; DESCRIPTION: Renders a orange line between points (136, 82) and (242, 231).
; PLAN: r0=136(x1), r1=82(y1), r2=242(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 82
LDI r2, 242
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow line between points (450, 63) and (178, 176).
; PLAN: r0=450(x1), r1=63(y1), r2=178(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 63
LDI r2, 178
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

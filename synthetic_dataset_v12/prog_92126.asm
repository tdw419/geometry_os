; DESCRIPTION: Renders a green line between points (63, 178) and (143, 12).
; PLAN: r0=63(x1), r1=178(y1), r2=143(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 178
LDI r2, 143
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

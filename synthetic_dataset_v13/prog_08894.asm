; DESCRIPTION: Renders a green line between points (256, 195) and (205, 205).
; PLAN: r0=256(x1), r1=195(y1), r2=205(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 195
LDI r2, 205
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

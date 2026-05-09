; DESCRIPTION: Renders a green line between points (368, 63) and (324, 176).
; PLAN: r0=368(x1), r1=63(y1), r2=324(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 63
LDI r2, 324
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

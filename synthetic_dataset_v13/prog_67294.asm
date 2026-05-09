; DESCRIPTION: Renders a green line between points (166, 21) and (11, 26).
; PLAN: r0=166(x1), r1=21(y1), r2=11(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 21
LDI r2, 11
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

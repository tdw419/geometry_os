; DESCRIPTION: Renders a green line between points (353, 245) and (221, 156).
; PLAN: r0=353(x1), r1=245(y1), r2=221(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 245
LDI r2, 221
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

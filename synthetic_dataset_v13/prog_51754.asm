; DESCRIPTION: Renders a green line between points (102, 213) and (192, 11).
; PLAN: r0=102(x1), r1=213(y1), r2=192(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 213
LDI r2, 192
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

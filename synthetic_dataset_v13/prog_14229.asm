; DESCRIPTION: Renders a green line between points (192, 166) and (213, 211).
; PLAN: r0=192(x1), r1=166(y1), r2=213(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 166
LDI r2, 213
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

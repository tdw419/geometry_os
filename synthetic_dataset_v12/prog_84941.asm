; DESCRIPTION: Renders a green line between points (442, 166) and (78, 192).
; PLAN: r0=442(x1), r1=166(y1), r2=78(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 166
LDI r2, 78
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

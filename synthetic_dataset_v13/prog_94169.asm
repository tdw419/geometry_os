; DESCRIPTION: Renders a yellow line between points (446, 84) and (166, 188).
; PLAN: r0=446(x1), r1=84(y1), r2=166(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 84
LDI r2, 166
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

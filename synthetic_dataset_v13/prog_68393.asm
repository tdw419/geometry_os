; DESCRIPTION: Renders a green line between points (374, 223) and (135, 26).
; PLAN: r0=374(x1), r1=223(y1), r2=135(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 223
LDI r2, 135
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

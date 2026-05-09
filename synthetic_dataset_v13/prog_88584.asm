; DESCRIPTION: Renders a green line between points (133, 222) and (242, 135).
; PLAN: r0=133(x1), r1=222(y1), r2=242(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 222
LDI r2, 242
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

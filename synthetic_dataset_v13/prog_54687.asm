; DESCRIPTION: Renders a green line between points (29, 15) and (32, 198).
; PLAN: r0=29(x1), r1=15(y1), r2=32(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 15
LDI r2, 32
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

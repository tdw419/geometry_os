; DESCRIPTION: Renders a yellow line between points (37, 84) and (346, 70).
; PLAN: r0=37(x1), r1=84(y1), r2=346(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 84
LDI r2, 346
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

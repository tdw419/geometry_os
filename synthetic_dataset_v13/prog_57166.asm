; DESCRIPTION: Renders a yellow line between points (140, 12) and (397, 198).
; PLAN: r0=140(x1), r1=12(y1), r2=397(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 12
LDI r2, 397
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

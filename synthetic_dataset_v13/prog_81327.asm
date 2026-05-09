; DESCRIPTION: Renders a yellow line between points (156, 37) and (397, 188).
; PLAN: r0=156(x1), r1=37(y1), r2=397(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 37
LDI r2, 397
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

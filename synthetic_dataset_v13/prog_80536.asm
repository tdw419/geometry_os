; DESCRIPTION: Renders a yellow line between points (217, 140) and (23, 128).
; PLAN: r0=217(x1), r1=140(y1), r2=23(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 140
LDI r2, 23
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

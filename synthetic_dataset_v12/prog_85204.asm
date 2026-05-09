; DESCRIPTION: Renders a yellow line between points (417, 103) and (475, 128).
; PLAN: r0=417(x1), r1=103(y1), r2=475(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 103
LDI r2, 475
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

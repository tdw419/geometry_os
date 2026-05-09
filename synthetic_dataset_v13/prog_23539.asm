; DESCRIPTION: Renders a yellow line between points (371, 98) and (4, 172).
; PLAN: r0=371(x1), r1=98(y1), r2=4(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 98
LDI r2, 4
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

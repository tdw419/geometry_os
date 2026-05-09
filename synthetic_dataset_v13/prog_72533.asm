; DESCRIPTION: Renders a yellow line between points (354, 97) and (63, 76).
; PLAN: r0=354(x1), r1=97(y1), r2=63(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 97
LDI r2, 63
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

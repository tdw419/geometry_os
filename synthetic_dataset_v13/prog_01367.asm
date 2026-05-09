; DESCRIPTION: Renders a yellow line between points (132, 82) and (272, 70).
; PLAN: r0=132(x1), r1=82(y1), r2=272(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 82
LDI r2, 272
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

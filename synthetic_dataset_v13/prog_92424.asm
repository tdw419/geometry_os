; DESCRIPTION: Renders a green line between points (372, 206) and (357, 132).
; PLAN: r0=372(x1), r1=206(y1), r2=357(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 206
LDI r2, 357
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

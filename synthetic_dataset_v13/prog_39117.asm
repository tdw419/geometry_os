; DESCRIPTION: Renders a green line between points (56, 86) and (82, 233).
; PLAN: r0=56(x1), r1=86(y1), r2=82(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 86
LDI r2, 82
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

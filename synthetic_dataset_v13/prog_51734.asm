; DESCRIPTION: Renders a yellow line between points (24, 234) and (66, 117).
; PLAN: r0=24(x1), r1=234(y1), r2=66(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 234
LDI r2, 66
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

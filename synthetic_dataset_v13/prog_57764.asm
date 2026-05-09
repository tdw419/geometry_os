; DESCRIPTION: Renders a green line between points (96, 23) and (276, 234).
; PLAN: r0=96(x1), r1=23(y1), r2=276(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 23
LDI r2, 276
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

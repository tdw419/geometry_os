; DESCRIPTION: Renders a black line between points (28, 179) and (91, 86).
; PLAN: r0=28(x1), r1=179(y1), r2=91(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 179
LDI r2, 91
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

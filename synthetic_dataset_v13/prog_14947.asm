; DESCRIPTION: Renders a green line between points (65, 128) and (91, 18).
; PLAN: r0=65(x1), r1=128(y1), r2=91(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 128
LDI r2, 91
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow line between points (76, 5) and (128, 162).
; PLAN: r0=76(x1), r1=5(y1), r2=128(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 5
LDI r2, 128
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (81, 30) and (162, 59).
; PLAN: r0=81(x1), r1=30(y1), r2=162(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 30
LDI r2, 162
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

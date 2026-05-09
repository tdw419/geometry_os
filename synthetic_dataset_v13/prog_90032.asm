; DESCRIPTION: Renders a green line between points (154, 52) and (4, 30).
; PLAN: r0=154(x1), r1=52(y1), r2=4(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 52
LDI r2, 4
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

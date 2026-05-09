; DESCRIPTION: Renders a green line between points (111, 137) and (175, 5).
; PLAN: r0=111(x1), r1=137(y1), r2=175(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 137
LDI r2, 175
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

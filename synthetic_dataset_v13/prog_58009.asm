; DESCRIPTION: Renders a white line between points (48, 166) and (91, 110).
; PLAN: r0=48(x1), r1=166(y1), r2=91(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 166
LDI r2, 91
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

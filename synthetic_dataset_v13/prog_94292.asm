; DESCRIPTION: Renders a white line between points (148, 37) and (220, 121).
; PLAN: r0=148(x1), r1=37(y1), r2=220(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 37
LDI r2, 220
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white line between points (6, 208) and (91, 91).
; PLAN: r0=6(x1), r1=208(y1), r2=91(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 208
LDI r2, 91
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

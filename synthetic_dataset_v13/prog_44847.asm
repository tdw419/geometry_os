; DESCRIPTION: Renders a white line between points (54, 52) and (91, 48).
; PLAN: r0=54(x1), r1=52(y1), r2=91(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 52
LDI r2, 91
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

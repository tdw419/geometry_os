; DESCRIPTION: Renders a white line between points (91, 111) and (227, 224).
; PLAN: r0=91(x1), r1=111(y1), r2=227(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 111
LDI r2, 227
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

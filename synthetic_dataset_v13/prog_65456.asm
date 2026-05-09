; DESCRIPTION: Renders a white line between points (310, 129) and (166, 89).
; PLAN: r0=310(x1), r1=129(y1), r2=166(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 129
LDI r2, 166
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white line between points (287, 23) and (2, 103).
; PLAN: r0=287(x1), r1=23(y1), r2=2(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 23
LDI r2, 2
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white line between points (55, 168) and (58, 40).
; PLAN: r0=55(x1), r1=168(y1), r2=58(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 168
LDI r2, 58
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

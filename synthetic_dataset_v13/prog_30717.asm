; DESCRIPTION: Renders a yellow line between points (334, 161) and (386, 60).
; PLAN: r0=334(x1), r1=161(y1), r2=386(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 161
LDI r2, 386
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

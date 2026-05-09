; DESCRIPTION: Renders a white line between points (331, 141) and (50, 8).
; PLAN: r0=331(x1), r1=141(y1), r2=50(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 141
LDI r2, 50
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

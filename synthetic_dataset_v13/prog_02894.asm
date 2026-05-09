; DESCRIPTION: Renders a white line between points (394, 117) and (371, 148).
; PLAN: r0=394(x1), r1=117(y1), r2=371(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 117
LDI r2, 371
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

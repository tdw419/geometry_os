; DESCRIPTION: Renders a white line between points (172, 208) and (480, 191).
; PLAN: r0=172(x1), r1=208(y1), r2=480(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 208
LDI r2, 480
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

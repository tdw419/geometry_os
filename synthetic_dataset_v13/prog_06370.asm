; DESCRIPTION: Renders a white line between points (172, 116) and (29, 152).
; PLAN: r0=172(x1), r1=116(y1), r2=29(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 116
LDI r2, 29
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

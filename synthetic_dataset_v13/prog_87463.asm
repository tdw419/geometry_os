; DESCRIPTION: Renders a white line between points (253, 215) and (229, 155).
; PLAN: r0=253(x1), r1=215(y1), r2=229(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 215
LDI r2, 229
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white line between points (144, 103) and (249, 45).
; PLAN: r0=144(x1), r1=103(y1), r2=249(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 103
LDI r2, 249
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

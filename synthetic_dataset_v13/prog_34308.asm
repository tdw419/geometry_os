; DESCRIPTION: Renders a white line between points (336, 109) and (393, 64).
; PLAN: r0=336(x1), r1=109(y1), r2=393(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 109
LDI r2, 393
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

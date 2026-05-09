; DESCRIPTION: Renders a white line between points (420, 169) and (32, 73).
; PLAN: r0=420(x1), r1=169(y1), r2=32(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 169
LDI r2, 32
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

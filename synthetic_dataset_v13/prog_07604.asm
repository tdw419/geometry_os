; DESCRIPTION: Renders a white line between points (227, 255) and (291, 143).
; PLAN: r0=227(x1), r1=255(y1), r2=291(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 255
LDI r2, 291
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

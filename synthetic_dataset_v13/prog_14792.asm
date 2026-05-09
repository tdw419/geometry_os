; DESCRIPTION: Renders a white line between points (24, 94) and (299, 223).
; PLAN: r0=24(x1), r1=94(y1), r2=299(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 94
LDI r2, 299
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

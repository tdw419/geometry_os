; DESCRIPTION: Renders a white line between points (34, 5) and (206, 61).
; PLAN: r0=34(x1), r1=5(y1), r2=206(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 5
LDI r2, 206
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (308, 30) and (308, 120).
; PLAN: r0=308(x1), r1=30(y1), r2=308(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 30
LDI r2, 308
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

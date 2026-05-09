; DESCRIPTION: Renders a white line between points (398, 88) and (308, 94).
; PLAN: r0=398(x1), r1=88(y1), r2=308(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 88
LDI r2, 308
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white line between points (389, 50) and (495, 229).
; PLAN: r0=389(x1), r1=50(y1), r2=495(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 50
LDI r2, 495
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

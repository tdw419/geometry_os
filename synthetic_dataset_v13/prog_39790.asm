; DESCRIPTION: Places a white line segment connecting (400, 126) to (503, 120).
; PLAN: r0=400(x1), r1=126(y1), r2=503(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 126
LDI r2, 503
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

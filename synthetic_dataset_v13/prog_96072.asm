; DESCRIPTION: Places a white line segment connecting (365, 113) to (85, 215).
; PLAN: r0=365(x1), r1=113(y1), r2=85(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 113
LDI r2, 85
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

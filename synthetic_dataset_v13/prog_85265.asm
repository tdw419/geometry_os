; DESCRIPTION: Places a white line segment connecting (223, 116) to (450, 206).
; PLAN: r0=223(x1), r1=116(y1), r2=450(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 116
LDI r2, 450
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

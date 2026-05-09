; DESCRIPTION: Places a white line segment connecting (184, 21) to (436, 42).
; PLAN: r0=184(x1), r1=21(y1), r2=436(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 21
LDI r2, 436
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

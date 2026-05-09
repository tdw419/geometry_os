; DESCRIPTION: Places a white line segment connecting (271, 85) to (42, 17).
; PLAN: r0=271(x1), r1=85(y1), r2=42(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 85
LDI r2, 42
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

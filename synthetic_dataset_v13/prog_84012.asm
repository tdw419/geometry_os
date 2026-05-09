; DESCRIPTION: Places a white line segment connecting (43, 32) to (308, 55).
; PLAN: r0=43(x1), r1=32(y1), r2=308(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 32
LDI r2, 308
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

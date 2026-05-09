; DESCRIPTION: Places a black line segment connecting (252, 42) to (255, 70).
; PLAN: r0=252(x1), r1=42(y1), r2=255(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 42
LDI r2, 255
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

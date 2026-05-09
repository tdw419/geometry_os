; DESCRIPTION: Places a white line segment connecting (134, 128) to (257, 42).
; PLAN: r0=134(x1), r1=128(y1), r2=257(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 128
LDI r2, 257
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

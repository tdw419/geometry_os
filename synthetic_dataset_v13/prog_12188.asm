; DESCRIPTION: Places a white line segment connecting (257, 48) to (189, 173).
; PLAN: r0=257(x1), r1=48(y1), r2=189(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 48
LDI r2, 189
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

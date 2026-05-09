; DESCRIPTION: Places a white circle of radius 63 at center (335, 154).
; PLAN: r0=335(x), r1=154(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 154
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

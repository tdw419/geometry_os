; DESCRIPTION: Renders a white box of size 32x31 starting at (391, 152).
; PLAN: r0=391(x), r1=152(y), r2=32(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 152
LDI r2, 32
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

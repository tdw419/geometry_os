; DESCRIPTION: Places a white 60x22 rectangle at position (289, 188).
; PLAN: r0=289(x), r1=188(y), r2=60(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 188
LDI r2, 60
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

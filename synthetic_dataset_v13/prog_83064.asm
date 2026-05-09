; DESCRIPTION: Renders a white box of size 16x116 starting at (351, 76).
; PLAN: r0=351(x), r1=76(y), r2=16(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 76
LDI r2, 16
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

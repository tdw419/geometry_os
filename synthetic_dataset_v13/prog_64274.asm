; DESCRIPTION: Renders a white box of size 32x76 starting at (247, 61).
; PLAN: r0=247(x), r1=61(y), r2=32(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 61
LDI r2, 32
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

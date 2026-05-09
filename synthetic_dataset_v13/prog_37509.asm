; DESCRIPTION: Renders a white box of size 61x34 starting at (32, 49).
; PLAN: r0=32(x), r1=49(y), r2=61(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 49
LDI r2, 61
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

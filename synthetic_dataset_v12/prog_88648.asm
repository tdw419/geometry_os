; DESCRIPTION: Renders a white box of size 38x102 starting at (142, 128).
; PLAN: r0=142(x), r1=128(y), r2=38(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 128
LDI r2, 38
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

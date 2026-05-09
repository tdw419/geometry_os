; DESCRIPTION: Renders a white box of size 64x117 starting at (148, 103).
; PLAN: r0=148(x), r1=103(y), r2=64(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 103
LDI r2, 64
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

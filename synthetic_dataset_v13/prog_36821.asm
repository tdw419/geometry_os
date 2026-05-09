; DESCRIPTION: Renders a white box of size 32x59 starting at (148, 137).
; PLAN: r0=148(x), r1=137(y), r2=32(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 137
LDI r2, 32
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

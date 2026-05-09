; DESCRIPTION: Renders a white box of size 101x55 starting at (28, 144).
; PLAN: r0=28(x), r1=144(y), r2=101(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 144
LDI r2, 101
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

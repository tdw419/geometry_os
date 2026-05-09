; DESCRIPTION: Renders a white box of size 62x35 starting at (6, 154).
; PLAN: r0=6(x), r1=154(y), r2=62(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 154
LDI r2, 62
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

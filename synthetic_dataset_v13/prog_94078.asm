; DESCRIPTION: Renders a white box of size 31x20 starting at (142, 154).
; PLAN: r0=142(x), r1=154(y), r2=31(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 154
LDI r2, 31
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

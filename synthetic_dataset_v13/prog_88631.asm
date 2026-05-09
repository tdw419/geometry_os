; DESCRIPTION: Renders a white box of size 10x13 starting at (229, 154).
; PLAN: r0=229(x), r1=154(y), r2=10(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 154
LDI r2, 10
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

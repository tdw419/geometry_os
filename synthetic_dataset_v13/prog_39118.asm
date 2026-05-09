; DESCRIPTION: Renders a white box of size 116x58 starting at (193, 154).
; PLAN: r0=193(x), r1=154(y), r2=116(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 154
LDI r2, 116
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

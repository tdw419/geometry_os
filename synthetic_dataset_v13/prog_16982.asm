; DESCRIPTION: Renders a red box of size 81x54 starting at (109, 154).
; PLAN: r0=109(x), r1=154(y), r2=81(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 154
LDI r2, 81
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

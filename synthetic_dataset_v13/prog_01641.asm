; DESCRIPTION: Renders a red box of size 95x73 starting at (407, 154).
; PLAN: r0=407(x), r1=154(y), r2=95(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 154
LDI r2, 95
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

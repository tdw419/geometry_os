; DESCRIPTION: Renders a red box of size 95x61 starting at (154, 22).
; PLAN: r0=154(x), r1=22(y), r2=95(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 22
LDI r2, 95
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

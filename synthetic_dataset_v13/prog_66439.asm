; DESCRIPTION: Renders a red box of size 70x100 starting at (84, 154).
; PLAN: r0=84(x), r1=154(y), r2=70(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 154
LDI r2, 70
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

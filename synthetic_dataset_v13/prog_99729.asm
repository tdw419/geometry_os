; DESCRIPTION: Renders a red box of size 24x89 starting at (261, 154).
; PLAN: r0=261(x), r1=154(y), r2=24(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 154
LDI r2, 24
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

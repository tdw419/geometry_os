; DESCRIPTION: Renders a red box of size 86x31 starting at (414, 12).
; PLAN: r0=414(x), r1=12(y), r2=86(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 12
LDI r2, 86
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

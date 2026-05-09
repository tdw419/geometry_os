; DESCRIPTION: Renders a red box of size 99x49 starting at (42, 166).
; PLAN: r0=42(x), r1=166(y), r2=99(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 166
LDI r2, 99
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

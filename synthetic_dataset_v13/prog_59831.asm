; DESCRIPTION: Renders a red box of size 10x39 starting at (166, 59).
; PLAN: r0=166(x), r1=59(y), r2=10(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 59
LDI r2, 10
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

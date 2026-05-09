; DESCRIPTION: Renders a red box of size 61x18 starting at (72, 56).
; PLAN: r0=72(x), r1=56(y), r2=61(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 56
LDI r2, 61
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

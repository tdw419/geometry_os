; DESCRIPTION: Renders a red box of size 103x40 starting at (88, 13).
; PLAN: r0=88(x), r1=13(y), r2=103(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 13
LDI r2, 103
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

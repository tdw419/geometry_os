; DESCRIPTION: Renders a red box of size 74x34 starting at (346, 196).
; PLAN: r0=346(x), r1=196(y), r2=74(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 196
LDI r2, 74
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

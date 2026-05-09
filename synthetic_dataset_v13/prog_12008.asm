; DESCRIPTION: Renders a red box of size 120x101 starting at (346, 28).
; PLAN: r0=346(x), r1=28(y), r2=120(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 28
LDI r2, 120
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

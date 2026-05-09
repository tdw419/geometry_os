; DESCRIPTION: Renders a red box of size 30x59 starting at (74, 12).
; PLAN: r0=74(x), r1=12(y), r2=30(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 12
LDI r2, 30
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

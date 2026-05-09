; DESCRIPTION: Renders a red box of size 12x61 starting at (28, 21).
; PLAN: r0=28(x), r1=21(y), r2=12(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 21
LDI r2, 12
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

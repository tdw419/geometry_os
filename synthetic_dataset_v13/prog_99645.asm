; DESCRIPTION: Renders a red box of size 85x81 starting at (294, 61).
; PLAN: r0=294(x), r1=61(y), r2=85(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 61
LDI r2, 85
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

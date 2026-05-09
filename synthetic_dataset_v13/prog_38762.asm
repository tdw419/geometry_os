; DESCRIPTION: Renders a red box of size 36x42 starting at (12, 15).
; PLAN: r0=12(x), r1=15(y), r2=36(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 15
LDI r2, 36
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

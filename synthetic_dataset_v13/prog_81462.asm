; DESCRIPTION: Renders a red box of size 16x26 starting at (85, 199).
; PLAN: r0=85(x), r1=199(y), r2=16(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 199
LDI r2, 16
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

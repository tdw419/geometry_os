; DESCRIPTION: Renders a orange box of size 88x53 starting at (317, 167).
; PLAN: r0=317(x), r1=167(y), r2=88(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 167
LDI r2, 88
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

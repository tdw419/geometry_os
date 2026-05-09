; DESCRIPTION: Renders a red box of size 53x89 starting at (130, 95).
; PLAN: r0=130(x), r1=95(y), r2=53(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 95
LDI r2, 53
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

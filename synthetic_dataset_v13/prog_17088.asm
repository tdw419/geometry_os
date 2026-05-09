; DESCRIPTION: Renders a red box of size 68x53 starting at (12, 31).
; PLAN: r0=12(x), r1=31(y), r2=68(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 31
LDI r2, 68
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

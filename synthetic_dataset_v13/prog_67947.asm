; DESCRIPTION: Renders a red box of size 53x115 starting at (432, 93).
; PLAN: r0=432(x), r1=93(y), r2=53(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 93
LDI r2, 53
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

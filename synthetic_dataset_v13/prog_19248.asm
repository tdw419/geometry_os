; DESCRIPTION: Renders a red box of size 68x53 starting at (168, 18).
; PLAN: r0=168(x), r1=18(y), r2=68(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 18
LDI r2, 68
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 12x31 starting at (53, 29).
; PLAN: r0=53(x), r1=29(y), r2=12(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 29
LDI r2, 12
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

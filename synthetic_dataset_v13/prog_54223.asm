; DESCRIPTION: Renders a red box of size 38x53 starting at (140, 188).
; PLAN: r0=140(x), r1=188(y), r2=38(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 188
LDI r2, 38
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

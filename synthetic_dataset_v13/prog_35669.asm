; DESCRIPTION: Renders a red box of size 43x53 starting at (220, 187).
; PLAN: r0=220(x), r1=187(y), r2=43(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 187
LDI r2, 43
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

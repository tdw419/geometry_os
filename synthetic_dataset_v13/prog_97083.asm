; DESCRIPTION: Renders a red box of size 47x72 starting at (461, 134).
; PLAN: r0=461(x), r1=134(y), r2=47(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 134
LDI r2, 47
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

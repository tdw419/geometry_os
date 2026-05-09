; DESCRIPTION: Renders a red box of size 103x18 starting at (343, 134).
; PLAN: r0=343(x), r1=134(y), r2=103(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 134
LDI r2, 103
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

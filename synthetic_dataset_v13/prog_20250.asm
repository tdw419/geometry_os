; DESCRIPTION: Renders a red box of size 41x42 starting at (399, 167).
; PLAN: r0=399(x), r1=167(y), r2=41(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 167
LDI r2, 41
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

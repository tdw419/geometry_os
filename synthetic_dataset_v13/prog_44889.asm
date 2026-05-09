; DESCRIPTION: Renders a red box of size 79x41 starting at (36, 27).
; PLAN: r0=36(x), r1=27(y), r2=79(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 27
LDI r2, 79
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

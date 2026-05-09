; DESCRIPTION: Renders a red box of size 109x41 starting at (178, 176).
; PLAN: r0=178(x), r1=176(y), r2=109(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 176
LDI r2, 109
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

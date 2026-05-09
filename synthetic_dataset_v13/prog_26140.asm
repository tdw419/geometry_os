; DESCRIPTION: Renders a red box of size 87x41 starting at (313, 30).
; PLAN: r0=313(x), r1=30(y), r2=87(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 30
LDI r2, 87
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

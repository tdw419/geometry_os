; DESCRIPTION: Renders a red box of size 17x41 starting at (467, 4).
; PLAN: r0=467(x), r1=4(y), r2=17(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 4
LDI r2, 17
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

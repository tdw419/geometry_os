; DESCRIPTION: Renders a red box of size 80x41 starting at (382, 115).
; PLAN: r0=382(x), r1=115(y), r2=80(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 115
LDI r2, 80
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 41x70 starting at (275, 106).
; PLAN: r0=275(x), r1=106(y), r2=41(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 106
LDI r2, 41
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

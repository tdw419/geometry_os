; DESCRIPTION: Renders a red box of size 90x23 starting at (306, 170).
; PLAN: r0=306(x), r1=170(y), r2=90(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 170
LDI r2, 90
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

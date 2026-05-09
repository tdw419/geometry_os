; DESCRIPTION: Renders a red box of size 90x105 starting at (310, 18).
; PLAN: r0=310(x), r1=18(y), r2=90(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 18
LDI r2, 90
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

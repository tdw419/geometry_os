; DESCRIPTION: Renders a red box of size 102x47 starting at (203, 199).
; PLAN: r0=203(x), r1=199(y), r2=102(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 199
LDI r2, 102
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

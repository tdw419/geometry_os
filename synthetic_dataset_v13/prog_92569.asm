; DESCRIPTION: Renders a red box of size 66x17 starting at (50, 191).
; PLAN: r0=50(x), r1=191(y), r2=66(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 191
LDI r2, 66
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

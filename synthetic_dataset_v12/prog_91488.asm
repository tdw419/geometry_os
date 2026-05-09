; DESCRIPTION: Renders a red box of size 17x27 starting at (492, 191).
; PLAN: r0=492(x), r1=191(y), r2=17(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 191
LDI r2, 17
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

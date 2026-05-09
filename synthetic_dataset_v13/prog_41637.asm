; DESCRIPTION: Renders a red box of size 48x40 starting at (426, 19).
; PLAN: r0=426(x), r1=19(y), r2=48(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 19
LDI r2, 48
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

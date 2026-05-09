; DESCRIPTION: Renders a red box of size 48x63 starting at (254, 114).
; PLAN: r0=254(x), r1=114(y), r2=48(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 114
LDI r2, 48
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

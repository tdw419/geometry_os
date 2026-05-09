; DESCRIPTION: Renders a red box of size 65x91 starting at (291, 157).
; PLAN: r0=291(x), r1=157(y), r2=65(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 157
LDI r2, 65
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

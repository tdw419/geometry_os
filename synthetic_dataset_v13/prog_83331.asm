; DESCRIPTION: Renders a red box of size 36x17 starting at (164, 84).
; PLAN: r0=164(x), r1=84(y), r2=36(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 84
LDI r2, 36
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

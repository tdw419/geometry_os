; DESCRIPTION: Renders a red box of size 21x114 starting at (239, 44).
; PLAN: r0=239(x), r1=44(y), r2=21(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 44
LDI r2, 21
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

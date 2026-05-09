; DESCRIPTION: Renders a red box of size 99x71 starting at (151, 94).
; PLAN: r0=151(x), r1=94(y), r2=99(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 94
LDI r2, 99
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

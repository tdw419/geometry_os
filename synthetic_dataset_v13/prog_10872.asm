; DESCRIPTION: Renders a red box of size 116x111 starting at (394, 122).
; PLAN: r0=394(x), r1=122(y), r2=116(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 122
LDI r2, 116
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

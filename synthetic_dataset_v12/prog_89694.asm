; DESCRIPTION: Renders a red box of size 28x17 starting at (463, 228).
; PLAN: r0=463(x), r1=228(y), r2=28(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 228
LDI r2, 28
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

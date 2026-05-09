; DESCRIPTION: Renders a red box of size 19x15 starting at (221, 178).
; PLAN: r0=221(x), r1=178(y), r2=19(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 178
LDI r2, 19
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

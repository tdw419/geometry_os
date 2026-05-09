; DESCRIPTION: Renders a red box of size 39x102 starting at (20, 115).
; PLAN: r0=20(x), r1=115(y), r2=39(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 115
LDI r2, 39
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

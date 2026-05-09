; DESCRIPTION: Renders a red box of size 29x25 starting at (385, 77).
; PLAN: r0=385(x), r1=77(y), r2=29(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 77
LDI r2, 29
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

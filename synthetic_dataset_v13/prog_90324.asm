; DESCRIPTION: Renders a red box of size 50x113 starting at (96, 97).
; PLAN: r0=96(x), r1=97(y), r2=50(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 97
LDI r2, 50
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

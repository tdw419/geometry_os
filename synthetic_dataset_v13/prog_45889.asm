; DESCRIPTION: Renders a orange box of size 74x18 starting at (96, 180).
; PLAN: r0=96(x), r1=180(y), r2=74(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 180
LDI r2, 74
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

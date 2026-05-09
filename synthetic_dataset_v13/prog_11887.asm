; DESCRIPTION: Renders a orange box of size 27x25 starting at (206, 151).
; PLAN: r0=206(x), r1=151(y), r2=27(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 151
LDI r2, 27
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

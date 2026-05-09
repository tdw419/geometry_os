; DESCRIPTION: Renders a orange box of size 113x59 starting at (220, 101).
; PLAN: r0=220(x), r1=101(y), r2=113(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 101
LDI r2, 113
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

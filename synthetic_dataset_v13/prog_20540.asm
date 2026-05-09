; DESCRIPTION: Renders a orange box of size 39x19 starting at (366, 113).
; PLAN: r0=366(x), r1=113(y), r2=39(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 113
LDI r2, 39
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

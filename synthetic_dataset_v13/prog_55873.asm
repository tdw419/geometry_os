; DESCRIPTION: Renders a orange box of size 84x32 starting at (19, 38).
; PLAN: r0=19(x), r1=38(y), r2=84(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 38
LDI r2, 84
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

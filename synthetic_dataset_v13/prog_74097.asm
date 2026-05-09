; DESCRIPTION: Renders a orange box of size 49x26 starting at (433, 219).
; PLAN: r0=433(x), r1=219(y), r2=49(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 219
LDI r2, 49
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

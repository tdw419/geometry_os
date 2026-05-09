; DESCRIPTION: Renders a orange box of size 45x105 starting at (326, 0).
; PLAN: r0=326(x), r1=0(y), r2=45(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 0
LDI r2, 45
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

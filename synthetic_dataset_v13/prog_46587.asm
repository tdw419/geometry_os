; DESCRIPTION: Renders a orange box of size 44x45 starting at (326, 72).
; PLAN: r0=326(x), r1=72(y), r2=44(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 72
LDI r2, 44
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

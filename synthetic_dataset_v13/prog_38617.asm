; DESCRIPTION: Renders a orange box of size 58x83 starting at (13, 33).
; PLAN: r0=13(x), r1=33(y), r2=58(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 33
LDI r2, 58
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange box of size 23x39 starting at (32, 166).
; PLAN: r0=32(x), r1=166(y), r2=23(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 166
LDI r2, 23
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

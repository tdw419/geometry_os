; DESCRIPTION: Renders a orange box of size 75x69 starting at (18, 27).
; PLAN: r0=18(x), r1=27(y), r2=75(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 27
LDI r2, 75
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

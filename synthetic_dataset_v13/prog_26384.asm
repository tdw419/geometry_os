; DESCRIPTION: Renders a orange box of size 37x44 starting at (473, 60).
; PLAN: r0=473(x), r1=60(y), r2=37(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 60
LDI r2, 37
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

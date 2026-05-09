; DESCRIPTION: Renders a orange box of size 102x65 starting at (233, 35).
; PLAN: r0=233(x), r1=35(y), r2=102(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 35
LDI r2, 102
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

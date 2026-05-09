; DESCRIPTION: Renders a orange box of size 17x75 starting at (412, 65).
; PLAN: r0=412(x), r1=65(y), r2=17(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 65
LDI r2, 17
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

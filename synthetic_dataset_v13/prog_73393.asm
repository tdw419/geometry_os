; DESCRIPTION: Renders a orange box of size 101x35 starting at (286, 160).
; PLAN: r0=286(x), r1=160(y), r2=101(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 160
LDI r2, 101
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

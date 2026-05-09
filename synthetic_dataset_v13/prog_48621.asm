; DESCRIPTION: Renders a orange box of size 13x117 starting at (269, 11).
; PLAN: r0=269(x), r1=11(y), r2=13(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 11
LDI r2, 13
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange box of size 35x49 starting at (281, 35).
; PLAN: r0=281(x), r1=35(y), r2=35(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 35
LDI r2, 35
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

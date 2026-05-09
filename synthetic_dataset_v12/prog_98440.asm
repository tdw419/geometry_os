; DESCRIPTION: Renders a orange box of size 19x104 starting at (281, 66).
; PLAN: r0=281(x), r1=66(y), r2=19(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 66
LDI r2, 19
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

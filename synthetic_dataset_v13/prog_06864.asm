; DESCRIPTION: Renders a orange box of size 104x66 starting at (88, 23).
; PLAN: r0=88(x), r1=23(y), r2=104(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 23
LDI r2, 104
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

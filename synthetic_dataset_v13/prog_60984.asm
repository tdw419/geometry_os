; DESCRIPTION: Renders a orange box of size 81x113 starting at (104, 22).
; PLAN: r0=104(x), r1=22(y), r2=81(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 22
LDI r2, 81
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

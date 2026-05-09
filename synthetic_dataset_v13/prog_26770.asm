; DESCRIPTION: Renders a orange box of size 81x96 starting at (206, 104).
; PLAN: r0=206(x), r1=104(y), r2=81(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 104
LDI r2, 81
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

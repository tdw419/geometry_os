; DESCRIPTION: Renders a orange box of size 69x104 starting at (322, 106).
; PLAN: r0=322(x), r1=106(y), r2=69(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 106
LDI r2, 69
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

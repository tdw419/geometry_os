; DESCRIPTION: Renders a orange box of size 104x11 starting at (103, 181).
; PLAN: r0=103(x), r1=181(y), r2=104(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 181
LDI r2, 104
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange box of size 104x53 starting at (203, 154).
; PLAN: r0=203(x), r1=154(y), r2=104(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 154
LDI r2, 104
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

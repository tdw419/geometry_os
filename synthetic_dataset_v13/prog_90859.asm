; DESCRIPTION: Renders a orange box of size 72x25 starting at (440, 69).
; PLAN: r0=440(x), r1=69(y), r2=72(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 69
LDI r2, 72
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

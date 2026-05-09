; DESCRIPTION: Renders a orange box of size 32x65 starting at (130, 69).
; PLAN: r0=130(x), r1=69(y), r2=32(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 69
LDI r2, 32
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

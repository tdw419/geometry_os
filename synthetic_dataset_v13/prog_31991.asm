; DESCRIPTION: Renders a orange box of size 92x119 starting at (154, 76).
; PLAN: r0=154(x), r1=76(y), r2=92(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 76
LDI r2, 92
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

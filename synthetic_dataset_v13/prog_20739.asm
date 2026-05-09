; DESCRIPTION: Renders a orange box of size 109x76 starting at (330, 179).
; PLAN: r0=330(x), r1=179(y), r2=109(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 179
LDI r2, 109
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange box of size 103x76 starting at (143, 130).
; PLAN: r0=143(x), r1=130(y), r2=103(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 130
LDI r2, 103
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange box of size 43x100 starting at (189, 82).
; PLAN: r0=189(x), r1=82(y), r2=43(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 82
LDI r2, 43
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

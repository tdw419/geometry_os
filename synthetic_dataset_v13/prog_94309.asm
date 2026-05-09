; DESCRIPTION: Renders a orange box of size 10x63 starting at (474, 189).
; PLAN: r0=474(x), r1=189(y), r2=10(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 189
LDI r2, 10
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

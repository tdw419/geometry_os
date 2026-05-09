; DESCRIPTION: Renders a orange box of size 50x91 starting at (144, 133).
; PLAN: r0=144(x), r1=133(y), r2=50(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 133
LDI r2, 50
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

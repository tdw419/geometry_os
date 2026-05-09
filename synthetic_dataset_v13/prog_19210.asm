; DESCRIPTION: Renders a orange box of size 83x53 starting at (224, 157).
; PLAN: r0=224(x), r1=157(y), r2=83(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 157
LDI r2, 83
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

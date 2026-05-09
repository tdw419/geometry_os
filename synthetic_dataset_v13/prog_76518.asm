; DESCRIPTION: Renders a orange box of size 80x53 starting at (388, 65).
; PLAN: r0=388(x), r1=65(y), r2=80(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 65
LDI r2, 80
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

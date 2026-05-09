; DESCRIPTION: Renders a orange box of size 44x15 starting at (300, 71).
; PLAN: r0=300(x), r1=71(y), r2=44(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 71
LDI r2, 44
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

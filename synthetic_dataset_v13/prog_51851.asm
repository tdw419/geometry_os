; DESCRIPTION: Renders a orange box of size 48x100 starting at (310, 61).
; PLAN: r0=310(x), r1=61(y), r2=48(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 61
LDI r2, 48
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

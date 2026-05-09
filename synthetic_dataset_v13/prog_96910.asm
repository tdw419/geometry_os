; DESCRIPTION: Renders a orange box of size 61x75 starting at (194, 71).
; PLAN: r0=194(x), r1=71(y), r2=61(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 71
LDI r2, 61
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

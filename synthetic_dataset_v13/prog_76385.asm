; DESCRIPTION: Renders a orange box of size 116x44 starting at (85, 109).
; PLAN: r0=85(x), r1=109(y), r2=116(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 109
LDI r2, 116
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

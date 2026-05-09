; DESCRIPTION: Renders a orange box of size 77x47 starting at (156, 0).
; PLAN: r0=156(x), r1=0(y), r2=77(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 0
LDI r2, 77
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

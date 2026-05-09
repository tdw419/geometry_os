; DESCRIPTION: Creates a orange rectangular region at (154, 134) spanning 114 by 40 pixels.
; PLAN: r0=154(x), r1=134(y), r2=114(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 134
LDI r2, 114
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

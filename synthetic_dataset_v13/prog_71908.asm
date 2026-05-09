; DESCRIPTION: Renders a orange box of size 94x29 starting at (183, 153).
; PLAN: r0=183(x), r1=153(y), r2=94(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 153
LDI r2, 94
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

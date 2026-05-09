; DESCRIPTION: Renders a orange box of size 107x33 starting at (148, 135).
; PLAN: r0=148(x), r1=135(y), r2=107(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 135
LDI r2, 107
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

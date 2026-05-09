; DESCRIPTION: Renders a orange box of size 31x73 starting at (163, 108).
; PLAN: r0=163(x), r1=108(y), r2=31(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 108
LDI r2, 31
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

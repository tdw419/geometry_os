; DESCRIPTION: Renders a orange box of size 111x102 starting at (331, 133).
; PLAN: r0=331(x), r1=133(y), r2=111(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 133
LDI r2, 111
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

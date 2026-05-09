; DESCRIPTION: Renders a orange box of size 66x83 starting at (191, 163).
; PLAN: r0=191(x), r1=163(y), r2=66(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 163
LDI r2, 66
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

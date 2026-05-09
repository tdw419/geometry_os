; DESCRIPTION: Renders a orange box of size 58x56 starting at (185, 46).
; PLAN: r0=185(x), r1=46(y), r2=58(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 46
LDI r2, 58
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

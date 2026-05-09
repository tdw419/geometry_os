; DESCRIPTION: Renders a orange box of size 56x44 starting at (431, 210).
; PLAN: r0=431(x), r1=210(y), r2=56(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 210
LDI r2, 56
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

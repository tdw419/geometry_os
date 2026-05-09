; DESCRIPTION: Renders a orange box of size 13x73 starting at (357, 45).
; PLAN: r0=357(x), r1=45(y), r2=13(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 45
LDI r2, 13
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

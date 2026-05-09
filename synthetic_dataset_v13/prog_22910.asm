; DESCRIPTION: Creates a orange rectangular region at (28, 49) spanning 91 by 49 pixels.
; PLAN: r0=28(x), r1=49(y), r2=91(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 49
LDI r2, 91
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

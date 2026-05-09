; DESCRIPTION: Creates a orange rectangular region at (102, 37) spanning 23 by 113 pixels.
; PLAN: r0=102(x), r1=37(y), r2=23(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 37
LDI r2, 23
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

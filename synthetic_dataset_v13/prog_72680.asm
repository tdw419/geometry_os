; DESCRIPTION: Creates a orange rectangular region at (166, 22) spanning 28 by 50 pixels.
; PLAN: r0=166(x), r1=22(y), r2=28(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 22
LDI r2, 28
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

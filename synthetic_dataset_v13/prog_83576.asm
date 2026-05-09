; DESCRIPTION: Creates a orange rectangular region at (341, 15) spanning 28 by 68 pixels.
; PLAN: r0=341(x), r1=15(y), r2=28(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 15
LDI r2, 28
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

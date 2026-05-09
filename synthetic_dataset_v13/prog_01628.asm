; DESCRIPTION: Creates a orange rectangular region at (391, 139) spanning 14 by 68 pixels.
; PLAN: r0=391(x), r1=139(y), r2=14(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 139
LDI r2, 14
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

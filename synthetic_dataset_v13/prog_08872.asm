; DESCRIPTION: Creates a orange rectangular region at (83, 139) spanning 50 by 39 pixels.
; PLAN: r0=83(x), r1=139(y), r2=50(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 139
LDI r2, 50
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

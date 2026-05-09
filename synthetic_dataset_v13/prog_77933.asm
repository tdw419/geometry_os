; DESCRIPTION: Creates a orange rectangular region at (44, 53) spanning 40 by 50 pixels.
; PLAN: r0=44(x), r1=53(y), r2=40(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 53
LDI r2, 40
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

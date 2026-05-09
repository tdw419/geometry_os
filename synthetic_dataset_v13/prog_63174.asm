; DESCRIPTION: Creates a orange rectangular region at (391, 49) spanning 59 by 60 pixels.
; PLAN: r0=391(x), r1=49(y), r2=59(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 49
LDI r2, 59
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

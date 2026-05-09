; DESCRIPTION: Creates a orange rectangular region at (425, 4) spanning 24 by 108 pixels.
; PLAN: r0=425(x), r1=4(y), r2=24(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 4
LDI r2, 24
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

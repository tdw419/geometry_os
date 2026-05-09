; DESCRIPTION: Creates a orange rectangular region at (353, 57) spanning 98 by 12 pixels.
; PLAN: r0=353(x), r1=57(y), r2=98(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 57
LDI r2, 98
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

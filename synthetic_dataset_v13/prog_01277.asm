; DESCRIPTION: Creates a orange rectangular region at (230, 69) spanning 26 by 98 pixels.
; PLAN: r0=230(x), r1=69(y), r2=26(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 69
LDI r2, 26
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (200, 107) spanning 39 by 13 pixels.
; PLAN: r0=200(x), r1=107(y), r2=39(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 107
LDI r2, 39
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

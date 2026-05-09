; DESCRIPTION: Creates a orange rectangular region at (416, 195) spanning 14 by 19 pixels.
; PLAN: r0=416(x), r1=195(y), r2=14(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 195
LDI r2, 14
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

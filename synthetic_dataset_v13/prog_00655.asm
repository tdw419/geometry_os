; DESCRIPTION: Creates a orange rectangular region at (416, 39) spanning 77 by 70 pixels.
; PLAN: r0=416(x), r1=39(y), r2=77(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 39
LDI r2, 77
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

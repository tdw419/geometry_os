; DESCRIPTION: Creates a orange rectangular region at (416, 172) spanning 59 by 28 pixels.
; PLAN: r0=416(x), r1=172(y), r2=59(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 172
LDI r2, 59
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

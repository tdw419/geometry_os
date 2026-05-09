; DESCRIPTION: Creates a orange rectangular region at (344, 40) spanning 44 by 97 pixels.
; PLAN: r0=344(x), r1=40(y), r2=44(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 40
LDI r2, 44
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (370, 70) spanning 58 by 97 pixels.
; PLAN: r0=370(x), r1=70(y), r2=58(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 70
LDI r2, 58
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (327, 217) spanning 97 by 25 pixels.
; PLAN: r0=327(x), r1=217(y), r2=97(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 217
LDI r2, 97
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

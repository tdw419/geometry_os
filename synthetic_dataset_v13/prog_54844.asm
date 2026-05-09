; DESCRIPTION: Creates a white rectangular region at (209, 30) spanning 68 by 97 pixels.
; PLAN: r0=209(x), r1=30(y), r2=68(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 30
LDI r2, 68
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

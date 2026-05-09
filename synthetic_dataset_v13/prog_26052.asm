; DESCRIPTION: Creates a white rectangular region at (209, 68) spanning 62 by 21 pixels.
; PLAN: r0=209(x), r1=68(y), r2=62(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 68
LDI r2, 62
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

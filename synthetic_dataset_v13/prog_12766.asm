; DESCRIPTION: Creates a white rectangular region at (349, 54) spanning 67 by 33 pixels.
; PLAN: r0=349(x), r1=54(y), r2=67(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 54
LDI r2, 67
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

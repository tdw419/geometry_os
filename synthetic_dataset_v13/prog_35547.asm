; DESCRIPTION: Creates a white rectangular region at (4, 192) spanning 38 by 57 pixels.
; PLAN: r0=4(x), r1=192(y), r2=38(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 192
LDI r2, 38
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

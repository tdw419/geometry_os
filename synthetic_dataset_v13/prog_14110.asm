; DESCRIPTION: Creates a white rectangular region at (428, 157) spanning 47 by 38 pixels.
; PLAN: r0=428(x), r1=157(y), r2=47(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 157
LDI r2, 47
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

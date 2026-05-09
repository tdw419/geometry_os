; DESCRIPTION: Creates a white rectangular region at (198, 142) spanning 108 by 47 pixels.
; PLAN: r0=198(x), r1=142(y), r2=108(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 142
LDI r2, 108
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

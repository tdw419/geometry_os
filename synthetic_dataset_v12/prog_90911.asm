; DESCRIPTION: Creates a white rectangular region at (35, 142) spanning 47 by 70 pixels.
; PLAN: r0=35(x), r1=142(y), r2=47(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 142
LDI r2, 47
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

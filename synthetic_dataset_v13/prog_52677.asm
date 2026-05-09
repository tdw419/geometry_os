; DESCRIPTION: Creates a white rectangular region at (198, 175) spanning 75 by 58 pixels.
; PLAN: r0=198(x), r1=175(y), r2=75(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 175
LDI r2, 75
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

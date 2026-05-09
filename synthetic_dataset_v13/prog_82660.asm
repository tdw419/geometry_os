; DESCRIPTION: Creates a white rectangular region at (416, 160) spanning 48 by 47 pixels.
; PLAN: r0=416(x), r1=160(y), r2=48(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 160
LDI r2, 48
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (385, 12) spanning 120 by 108 pixels.
; PLAN: r0=385(x), r1=12(y), r2=120(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 12
LDI r2, 120
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

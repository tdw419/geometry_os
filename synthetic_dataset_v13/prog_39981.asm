; DESCRIPTION: Creates a white rectangular region at (338, 108) spanning 72 by 50 pixels.
; PLAN: r0=338(x), r1=108(y), r2=72(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 108
LDI r2, 72
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

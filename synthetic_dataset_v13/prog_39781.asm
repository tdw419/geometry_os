; DESCRIPTION: Creates a white rectangular region at (320, 59) spanning 19 by 26 pixels.
; PLAN: r0=320(x), r1=59(y), r2=19(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 59
LDI r2, 19
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

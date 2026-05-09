; DESCRIPTION: Creates a red rectangular region at (320, 59) spanning 23 by 19 pixels.
; PLAN: r0=320(x), r1=59(y), r2=23(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 59
LDI r2, 23
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (212, 108) spanning 96 by 61 pixels.
; PLAN: r0=212(x), r1=108(y), r2=96(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 108
LDI r2, 96
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

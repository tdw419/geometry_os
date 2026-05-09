; DESCRIPTION: Creates a white rectangular region at (371, 39) spanning 15 by 82 pixels.
; PLAN: r0=371(x), r1=39(y), r2=15(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 39
LDI r2, 15
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (315, 13) spanning 39 by 64 pixels.
; PLAN: r0=315(x), r1=13(y), r2=39(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 13
LDI r2, 39
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

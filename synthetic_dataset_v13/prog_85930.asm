; DESCRIPTION: Creates a white rectangular region at (334, 240) spanning 84 by 16 pixels.
; PLAN: r0=334(x), r1=240(y), r2=84(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 240
LDI r2, 84
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

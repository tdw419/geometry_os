; DESCRIPTION: Creates a white rectangular region at (240, 181) spanning 75 by 25 pixels.
; PLAN: r0=240(x), r1=181(y), r2=75(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 181
LDI r2, 75
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

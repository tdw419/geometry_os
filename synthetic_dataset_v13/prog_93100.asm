; DESCRIPTION: Creates a black rectangular region at (240, 70) spanning 47 by 64 pixels.
; PLAN: r0=240(x), r1=70(y), r2=47(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 70
LDI r2, 47
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

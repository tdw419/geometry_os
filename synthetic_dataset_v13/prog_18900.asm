; DESCRIPTION: Creates a black rectangular region at (255, 159) spanning 56 by 92 pixels.
; PLAN: r0=255(x), r1=159(y), r2=56(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 159
LDI r2, 56
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

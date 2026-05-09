; DESCRIPTION: Creates a black rectangular region at (419, 59) spanning 84 by 82 pixels.
; PLAN: r0=419(x), r1=59(y), r2=84(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 59
LDI r2, 84
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

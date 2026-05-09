; DESCRIPTION: Creates a black rectangular region at (57, 144) spanning 44 by 82 pixels.
; PLAN: r0=57(x), r1=144(y), r2=44(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 144
LDI r2, 44
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

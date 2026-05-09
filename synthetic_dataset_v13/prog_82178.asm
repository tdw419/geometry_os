; DESCRIPTION: Creates a black rectangular region at (163, 144) spanning 71 by 50 pixels.
; PLAN: r0=163(x), r1=144(y), r2=71(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 144
LDI r2, 71
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

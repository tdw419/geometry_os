; DESCRIPTION: Creates a black rectangular region at (381, 209) spanning 15 by 16 pixels.
; PLAN: r0=381(x), r1=209(y), r2=15(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 209
LDI r2, 15
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

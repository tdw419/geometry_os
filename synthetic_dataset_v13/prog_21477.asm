; DESCRIPTION: Creates a black rectangular region at (164, 17) spanning 97 by 90 pixels.
; PLAN: r0=164(x), r1=17(y), r2=97(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 17
LDI r2, 97
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

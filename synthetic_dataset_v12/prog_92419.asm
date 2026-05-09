; DESCRIPTION: Creates a black rectangular region at (417, 178) spanning 28 by 56 pixels.
; PLAN: r0=417(x), r1=178(y), r2=28(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 178
LDI r2, 28
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

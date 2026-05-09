; DESCRIPTION: Creates a black rectangular region at (442, 178) spanning 49 by 27 pixels.
; PLAN: r0=442(x), r1=178(y), r2=49(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 178
LDI r2, 49
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

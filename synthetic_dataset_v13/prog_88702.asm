; DESCRIPTION: Creates a black rectangular region at (264, 1) spanning 19 by 107 pixels.
; PLAN: r0=264(x), r1=1(y), r2=19(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 1
LDI r2, 19
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

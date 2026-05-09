; DESCRIPTION: Creates a black rectangular region at (278, 183) spanning 50 by 33 pixels.
; PLAN: r0=278(x), r1=183(y), r2=50(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 183
LDI r2, 50
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

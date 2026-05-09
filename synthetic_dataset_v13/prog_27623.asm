; DESCRIPTION: Creates a black rectangular region at (386, 135) spanning 105 by 13 pixels.
; PLAN: r0=386(x), r1=135(y), r2=105(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 135
LDI r2, 105
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

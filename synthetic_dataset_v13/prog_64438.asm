; DESCRIPTION: Creates a black rectangular region at (127, 5) spanning 30 by 31 pixels.
; PLAN: r0=127(x), r1=5(y), r2=30(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 5
LDI r2, 30
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

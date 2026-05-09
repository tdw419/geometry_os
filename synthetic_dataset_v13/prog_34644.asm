; DESCRIPTION: Creates a black rectangular region at (21, 149) spanning 15 by 35 pixels.
; PLAN: r0=21(x), r1=149(y), r2=15(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 149
LDI r2, 15
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (330, 210) spanning 83 by 35 pixels.
; PLAN: r0=330(x), r1=210(y), r2=83(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 210
LDI r2, 83
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

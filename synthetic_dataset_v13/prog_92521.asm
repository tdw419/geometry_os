; DESCRIPTION: Creates a black rectangular region at (35, 5) spanning 60 by 91 pixels.
; PLAN: r0=35(x), r1=5(y), r2=60(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 5
LDI r2, 60
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

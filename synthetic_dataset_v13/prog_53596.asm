; DESCRIPTION: Creates a black rectangular region at (350, 18) spanning 80 by 76 pixels.
; PLAN: r0=350(x), r1=18(y), r2=80(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 18
LDI r2, 80
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (350, 14) spanning 40 by 23 pixels.
; PLAN: r0=350(x), r1=14(y), r2=40(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 14
LDI r2, 40
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

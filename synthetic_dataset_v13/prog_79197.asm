; DESCRIPTION: Creates a black rectangular region at (402, 99) spanning 50 by 33 pixels.
; PLAN: r0=402(x), r1=99(y), r2=50(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 99
LDI r2, 50
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

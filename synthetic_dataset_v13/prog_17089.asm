; DESCRIPTION: Creates a black rectangular region at (37, 94) spanning 50 by 13 pixels.
; PLAN: r0=37(x), r1=94(y), r2=50(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 94
LDI r2, 50
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

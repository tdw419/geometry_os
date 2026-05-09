; DESCRIPTION: Creates a black rectangular region at (13, 207) spanning 16 by 31 pixels.
; PLAN: r0=13(x), r1=207(y), r2=16(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 207
LDI r2, 16
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

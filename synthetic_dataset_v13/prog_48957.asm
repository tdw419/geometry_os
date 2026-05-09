; DESCRIPTION: Creates a black rectangular region at (359, 75) spanning 110 by 42 pixels.
; PLAN: r0=359(x), r1=75(y), r2=110(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 75
LDI r2, 110
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

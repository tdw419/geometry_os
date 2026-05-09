; DESCRIPTION: Creates a orange rectangular region at (278, 115) spanning 99 by 32 pixels.
; PLAN: r0=278(x), r1=115(y), r2=99(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 115
LDI r2, 99
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

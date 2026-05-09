; DESCRIPTION: Creates a black rectangular region at (428, 14) spanning 16 by 63 pixels.
; PLAN: r0=428(x), r1=14(y), r2=16(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 14
LDI r2, 16
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

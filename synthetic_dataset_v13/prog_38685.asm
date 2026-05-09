; DESCRIPTION: Creates a black rectangular region at (123, 55) spanning 16 by 32 pixels.
; PLAN: r0=123(x), r1=55(y), r2=16(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 55
LDI r2, 16
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

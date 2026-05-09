; DESCRIPTION: Creates a black rectangular region at (45, 218) spanning 24 by 32 pixels.
; PLAN: r0=45(x), r1=218(y), r2=24(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 218
LDI r2, 24
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

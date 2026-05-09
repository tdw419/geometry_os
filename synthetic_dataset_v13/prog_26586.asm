; DESCRIPTION: Creates a black rectangular region at (419, 154) spanning 64 by 31 pixels.
; PLAN: r0=419(x), r1=154(y), r2=64(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 154
LDI r2, 64
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

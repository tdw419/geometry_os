; DESCRIPTION: Creates a black rectangular region at (395, 68) spanning 90 by 64 pixels.
; PLAN: r0=395(x), r1=68(y), r2=90(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 68
LDI r2, 90
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

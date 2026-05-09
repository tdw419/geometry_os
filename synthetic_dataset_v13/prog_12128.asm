; DESCRIPTION: Creates a black rectangular region at (365, 157) spanning 90 by 64 pixels.
; PLAN: r0=365(x), r1=157(y), r2=90(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 157
LDI r2, 90
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

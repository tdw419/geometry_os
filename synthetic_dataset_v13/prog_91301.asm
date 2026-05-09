; DESCRIPTION: Creates a black rectangular region at (179, 128) spanning 75 by 36 pixels.
; PLAN: r0=179(x), r1=128(y), r2=75(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 128
LDI r2, 75
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

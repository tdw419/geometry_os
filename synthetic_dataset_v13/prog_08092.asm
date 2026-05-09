; DESCRIPTION: Creates a black rectangular region at (75, 128) spanning 24 by 80 pixels.
; PLAN: r0=75(x), r1=128(y), r2=24(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 128
LDI r2, 24
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

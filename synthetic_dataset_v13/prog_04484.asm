; DESCRIPTION: Creates a black rectangular region at (131, 144) spanning 107 by 60 pixels.
; PLAN: r0=131(x), r1=144(y), r2=107(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 144
LDI r2, 107
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

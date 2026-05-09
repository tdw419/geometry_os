; DESCRIPTION: Creates a white rectangular region at (211, 128) spanning 106 by 90 pixels.
; PLAN: r0=211(x), r1=128(y), r2=106(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 128
LDI r2, 106
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

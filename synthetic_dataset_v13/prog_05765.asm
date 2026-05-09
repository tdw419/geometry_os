; DESCRIPTION: Creates a yellow rectangular region at (439, 126) spanning 32 by 96 pixels.
; PLAN: r0=439(x), r1=126(y), r2=32(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 126
LDI r2, 32
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

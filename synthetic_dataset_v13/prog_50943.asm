; DESCRIPTION: Creates a white rectangular region at (424, 222) spanning 87 by 24 pixels.
; PLAN: r0=424(x), r1=222(y), r2=87(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 222
LDI r2, 87
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

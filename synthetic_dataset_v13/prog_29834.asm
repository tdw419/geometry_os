; DESCRIPTION: Creates a white rectangular region at (253, 22) spanning 116 by 32 pixels.
; PLAN: r0=253(x), r1=22(y), r2=116(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 22
LDI r2, 116
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

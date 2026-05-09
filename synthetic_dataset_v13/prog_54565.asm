; DESCRIPTION: Creates a white rectangular region at (253, 207) spanning 33 by 24 pixels.
; PLAN: r0=253(x), r1=207(y), r2=33(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 207
LDI r2, 33
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

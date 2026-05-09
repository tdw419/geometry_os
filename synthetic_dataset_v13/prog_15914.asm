; DESCRIPTION: Creates a white rectangular region at (304, 28) spanning 22 by 48 pixels.
; PLAN: r0=304(x), r1=28(y), r2=22(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 28
LDI r2, 22
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

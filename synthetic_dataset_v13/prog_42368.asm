; DESCRIPTION: Creates a white rectangular region at (1, 16) spanning 62 by 92 pixels.
; PLAN: r0=1(x), r1=16(y), r2=62(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 16
LDI r2, 62
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

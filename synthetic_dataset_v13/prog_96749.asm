; DESCRIPTION: Creates a white rectangular region at (250, 27) spanning 32 by 34 pixels.
; PLAN: r0=250(x), r1=27(y), r2=32(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 27
LDI r2, 32
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

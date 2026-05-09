; DESCRIPTION: Creates a white rectangular region at (7, 4) spanning 44 by 32 pixels.
; PLAN: r0=7(x), r1=4(y), r2=44(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 4
LDI r2, 44
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

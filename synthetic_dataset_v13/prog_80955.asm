; DESCRIPTION: Creates a black rectangular region at (0, 57) spanning 12 by 20 pixels.
; PLAN: r0=0(x), r1=57(y), r2=12(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 57
LDI r2, 12
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

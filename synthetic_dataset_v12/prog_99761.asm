; DESCRIPTION: Creates a white rectangular region at (16, 111) spanning 78 by 18 pixels.
; PLAN: r0=16(x), r1=111(y), r2=78(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 111
LDI r2, 78
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

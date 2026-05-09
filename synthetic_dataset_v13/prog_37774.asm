; DESCRIPTION: Creates a white rectangular region at (52, 4) spanning 32 by 29 pixels.
; PLAN: r0=52(x), r1=4(y), r2=32(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 4
LDI r2, 32
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

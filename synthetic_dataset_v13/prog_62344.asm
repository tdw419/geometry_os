; DESCRIPTION: Creates a white rectangular region at (425, 40) spanning 32 by 36 pixels.
; PLAN: r0=425(x), r1=40(y), r2=32(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 40
LDI r2, 32
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

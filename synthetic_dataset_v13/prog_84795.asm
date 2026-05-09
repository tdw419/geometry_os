; DESCRIPTION: Creates a white rectangular region at (370, 28) spanning 36 by 86 pixels.
; PLAN: r0=370(x), r1=28(y), r2=36(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 28
LDI r2, 36
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

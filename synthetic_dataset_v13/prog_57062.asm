; DESCRIPTION: Creates a white rectangular region at (221, 30) spanning 86 by 61 pixels.
; PLAN: r0=221(x), r1=30(y), r2=86(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 30
LDI r2, 86
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

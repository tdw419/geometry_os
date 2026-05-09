; DESCRIPTION: Creates a white rectangular region at (417, 81) spanning 37 by 61 pixels.
; PLAN: r0=417(x), r1=81(y), r2=37(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 81
LDI r2, 37
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

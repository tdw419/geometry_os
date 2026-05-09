; DESCRIPTION: Creates a white rectangular region at (297, 37) spanning 93 by 105 pixels.
; PLAN: r0=297(x), r1=37(y), r2=93(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 37
LDI r2, 93
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

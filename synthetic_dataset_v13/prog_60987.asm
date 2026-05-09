; DESCRIPTION: Creates a white rectangular region at (270, 13) spanning 107 by 115 pixels.
; PLAN: r0=270(x), r1=13(y), r2=107(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 13
LDI r2, 107
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

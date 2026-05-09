; DESCRIPTION: Creates a white rectangular region at (305, 30) spanning 107 by 15 pixels.
; PLAN: r0=305(x), r1=30(y), r2=107(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 30
LDI r2, 107
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

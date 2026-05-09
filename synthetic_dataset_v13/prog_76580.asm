; DESCRIPTION: Creates a white rectangular region at (370, 114) spanning 16 by 11 pixels.
; PLAN: r0=370(x), r1=114(y), r2=16(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 114
LDI r2, 16
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

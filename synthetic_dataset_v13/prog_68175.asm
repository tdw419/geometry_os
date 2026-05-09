; DESCRIPTION: Creates a white rectangular region at (354, 194) spanning 34 by 22 pixels.
; PLAN: r0=354(x), r1=194(y), r2=34(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 194
LDI r2, 34
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

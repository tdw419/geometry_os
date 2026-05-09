; DESCRIPTION: Creates a white rectangular region at (45, 170) spanning 120 by 72 pixels.
; PLAN: r0=45(x), r1=170(y), r2=120(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 170
LDI r2, 120
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

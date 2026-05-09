; DESCRIPTION: Creates a white rectangular region at (285, 109) spanning 23 by 13 pixels.
; PLAN: r0=285(x), r1=109(y), r2=23(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 109
LDI r2, 23
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

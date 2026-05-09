; DESCRIPTION: Creates a white rectangular region at (293, 35) spanning 68 by 99 pixels.
; PLAN: r0=293(x), r1=35(y), r2=68(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 35
LDI r2, 68
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

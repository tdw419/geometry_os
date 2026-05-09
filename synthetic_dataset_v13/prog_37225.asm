; DESCRIPTION: Creates a white rectangular region at (52, 99) spanning 40 by 104 pixels.
; PLAN: r0=52(x), r1=99(y), r2=40(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 99
LDI r2, 40
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

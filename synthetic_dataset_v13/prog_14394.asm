; DESCRIPTION: Creates a white rectangular region at (480, 19) spanning 15 by 75 pixels.
; PLAN: r0=480(x), r1=19(y), r2=15(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 19
LDI r2, 15
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

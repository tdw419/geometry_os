; DESCRIPTION: Creates a white rectangular region at (380, 79) spanning 23 by 110 pixels.
; PLAN: r0=380(x), r1=79(y), r2=23(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 79
LDI r2, 23
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

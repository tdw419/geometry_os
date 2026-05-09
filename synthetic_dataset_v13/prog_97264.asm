; DESCRIPTION: Creates a white rectangular region at (365, 79) spanning 105 by 110 pixels.
; PLAN: r0=365(x), r1=79(y), r2=105(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 79
LDI r2, 105
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

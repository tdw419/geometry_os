; DESCRIPTION: Creates a white rectangular region at (250, 44) spanning 41 by 84 pixels.
; PLAN: r0=250(x), r1=44(y), r2=41(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 44
LDI r2, 41
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

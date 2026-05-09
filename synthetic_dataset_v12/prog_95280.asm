; DESCRIPTION: Creates a white rectangular region at (331, 117) spanning 79 by 41 pixels.
; PLAN: r0=331(x), r1=117(y), r2=79(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 117
LDI r2, 79
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

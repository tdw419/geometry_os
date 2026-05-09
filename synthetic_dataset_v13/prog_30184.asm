; DESCRIPTION: Creates a white rectangular region at (250, 186) spanning 41 by 63 pixels.
; PLAN: r0=250(x), r1=186(y), r2=41(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 186
LDI r2, 41
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (250, 38) spanning 86 by 41 pixels.
; PLAN: r0=250(x), r1=38(y), r2=86(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 38
LDI r2, 86
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

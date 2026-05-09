; DESCRIPTION: Creates a white rectangular region at (305, 41) spanning 97 by 92 pixels.
; PLAN: r0=305(x), r1=41(y), r2=97(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 41
LDI r2, 97
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

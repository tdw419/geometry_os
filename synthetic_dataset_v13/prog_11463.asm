; DESCRIPTION: Creates a black rectangular region at (59, 57) spanning 41 by 86 pixels.
; PLAN: r0=59(x), r1=57(y), r2=41(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 57
LDI r2, 41
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

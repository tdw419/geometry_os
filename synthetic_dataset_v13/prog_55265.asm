; DESCRIPTION: Creates a black rectangular region at (320, 46) spanning 47 by 41 pixels.
; PLAN: r0=320(x), r1=46(y), r2=47(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 46
LDI r2, 47
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

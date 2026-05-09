; DESCRIPTION: Creates a black rectangular region at (171, 84) spanning 95 by 16 pixels.
; PLAN: r0=171(x), r1=84(y), r2=95(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 84
LDI r2, 95
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

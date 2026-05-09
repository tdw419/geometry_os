; DESCRIPTION: Creates a black rectangular region at (24, 47) spanning 109 by 72 pixels.
; PLAN: r0=24(x), r1=47(y), r2=109(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 47
LDI r2, 109
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

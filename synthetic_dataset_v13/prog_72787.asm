; DESCRIPTION: Creates a black rectangular region at (82, 26) spanning 100 by 80 pixels.
; PLAN: r0=82(x), r1=26(y), r2=100(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 26
LDI r2, 100
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

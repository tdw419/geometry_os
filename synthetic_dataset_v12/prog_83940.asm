; DESCRIPTION: Creates a black rectangular region at (58, 25) spanning 79 by 93 pixels.
; PLAN: r0=58(x), r1=25(y), r2=79(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 25
LDI r2, 79
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

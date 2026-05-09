; DESCRIPTION: Creates a black rectangular region at (309, 47) spanning 113 by 22 pixels.
; PLAN: r0=309(x), r1=47(y), r2=113(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 47
LDI r2, 113
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

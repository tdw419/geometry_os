; DESCRIPTION: Creates a black rectangular region at (440, 167) spanning 68 by 49 pixels.
; PLAN: r0=440(x), r1=167(y), r2=68(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 167
LDI r2, 68
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

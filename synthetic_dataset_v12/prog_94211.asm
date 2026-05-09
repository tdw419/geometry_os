; DESCRIPTION: Creates a black rectangular region at (347, 146) spanning 65 by 68 pixels.
; PLAN: r0=347(x), r1=146(y), r2=65(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 146
LDI r2, 65
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

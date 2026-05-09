; DESCRIPTION: Creates a black rectangular region at (408, 55) spanning 86 by 91 pixels.
; PLAN: r0=408(x), r1=55(y), r2=86(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 55
LDI r2, 86
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

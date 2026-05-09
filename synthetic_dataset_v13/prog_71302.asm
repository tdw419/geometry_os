; DESCRIPTION: Creates a black rectangular region at (481, 193) spanning 13 by 59 pixels.
; PLAN: r0=481(x), r1=193(y), r2=13(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 193
LDI r2, 13
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

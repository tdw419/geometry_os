; DESCRIPTION: Creates a black rectangular region at (193, 181) spanning 18 by 55 pixels.
; PLAN: r0=193(x), r1=181(y), r2=18(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 181
LDI r2, 18
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (433, 99) spanning 55 by 10 pixels.
; PLAN: r0=433(x), r1=99(y), r2=55(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 99
LDI r2, 55
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (101, 159) spanning 33 by 86 pixels.
; PLAN: r0=101(x), r1=159(y), r2=33(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 159
LDI r2, 33
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

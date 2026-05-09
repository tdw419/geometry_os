; DESCRIPTION: Creates a black rectangular region at (10, 138) spanning 90 by 94 pixels.
; PLAN: r0=10(x), r1=138(y), r2=90(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 138
LDI r2, 90
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

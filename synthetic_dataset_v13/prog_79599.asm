; DESCRIPTION: Creates a yellow rectangular region at (94, 55) spanning 53 by 48 pixels.
; PLAN: r0=94(x), r1=55(y), r2=53(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 55
LDI r2, 53
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

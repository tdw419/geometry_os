; DESCRIPTION: Creates a black rectangular region at (206, 53) spanning 48 by 29 pixels.
; PLAN: r0=206(x), r1=53(y), r2=48(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 53
LDI r2, 48
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

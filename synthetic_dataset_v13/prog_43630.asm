; DESCRIPTION: Creates a black rectangular region at (231, 150) spanning 48 by 53 pixels.
; PLAN: r0=231(x), r1=150(y), r2=48(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 150
LDI r2, 48
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (345, 26) spanning 74 by 48 pixels.
; PLAN: r0=345(x), r1=26(y), r2=74(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 26
LDI r2, 74
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

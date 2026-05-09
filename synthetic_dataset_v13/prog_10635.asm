; DESCRIPTION: Creates a black rectangular region at (61, 9) spanning 98 by 48 pixels.
; PLAN: r0=61(x), r1=9(y), r2=98(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 9
LDI r2, 98
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

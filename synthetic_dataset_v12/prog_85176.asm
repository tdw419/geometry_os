; DESCRIPTION: Creates a black rectangular region at (264, 164) spanning 48 by 23 pixels.
; PLAN: r0=264(x), r1=164(y), r2=48(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 164
LDI r2, 48
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

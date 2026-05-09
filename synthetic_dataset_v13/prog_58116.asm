; DESCRIPTION: Creates a yellow rectangular region at (317, 83) spanning 56 by 24 pixels.
; PLAN: r0=317(x), r1=83(y), r2=56(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 83
LDI r2, 56
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

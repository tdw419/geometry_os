; DESCRIPTION: Creates a black rectangular region at (201, 205) spanning 90 by 39 pixels.
; PLAN: r0=201(x), r1=205(y), r2=90(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 205
LDI r2, 90
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

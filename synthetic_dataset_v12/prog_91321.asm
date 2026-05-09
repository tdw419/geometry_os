; DESCRIPTION: Creates a black rectangular region at (194, 190) spanning 10 by 56 pixels.
; PLAN: r0=194(x), r1=190(y), r2=10(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 190
LDI r2, 10
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

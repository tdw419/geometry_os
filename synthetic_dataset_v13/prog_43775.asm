; DESCRIPTION: Creates a black rectangular region at (325, 190) spanning 46 by 16 pixels.
; PLAN: r0=325(x), r1=190(y), r2=46(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 190
LDI r2, 46
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

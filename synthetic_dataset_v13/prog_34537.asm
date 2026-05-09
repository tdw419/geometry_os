; DESCRIPTION: Creates a black rectangular region at (176, 190) spanning 31 by 21 pixels.
; PLAN: r0=176(x), r1=190(y), r2=31(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 190
LDI r2, 31
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

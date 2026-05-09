; DESCRIPTION: Creates a black rectangular region at (280, 190) spanning 62 by 48 pixels.
; PLAN: r0=280(x), r1=190(y), r2=62(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 190
LDI r2, 62
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

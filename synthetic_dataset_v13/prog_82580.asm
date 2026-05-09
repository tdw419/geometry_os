; DESCRIPTION: Creates a black rectangular region at (190, 144) spanning 112 by 79 pixels.
; PLAN: r0=190(x), r1=144(y), r2=112(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 144
LDI r2, 112
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

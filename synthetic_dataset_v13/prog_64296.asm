; DESCRIPTION: Creates a purple rectangular region at (320, 80) spanning 12 by 23 pixels.
; PLAN: r0=320(x), r1=80(y), r2=12(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 80
LDI r2, 12
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

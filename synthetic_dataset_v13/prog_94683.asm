; DESCRIPTION: Creates a blue rectangular region at (156, 21) spanning 90 by 84 pixels.
; PLAN: r0=156(x), r1=21(y), r2=90(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 21
LDI r2, 90
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

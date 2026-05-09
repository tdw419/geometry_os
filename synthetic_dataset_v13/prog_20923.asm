; DESCRIPTION: Creates a blue rectangular region at (143, 75) spanning 68 by 72 pixels.
; PLAN: r0=143(x), r1=75(y), r2=68(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 75
LDI r2, 68
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

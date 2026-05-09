; DESCRIPTION: Creates a blue rectangular region at (382, 66) spanning 95 by 109 pixels.
; PLAN: r0=382(x), r1=66(y), r2=95(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 66
LDI r2, 95
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

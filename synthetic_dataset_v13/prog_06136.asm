; DESCRIPTION: Creates a blue rectangular region at (29, 159) spanning 103 by 75 pixels.
; PLAN: r0=29(x), r1=159(y), r2=103(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 159
LDI r2, 103
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

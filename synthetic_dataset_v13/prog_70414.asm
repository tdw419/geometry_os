; DESCRIPTION: Creates a blue rectangular region at (353, 90) spanning 30 by 113 pixels.
; PLAN: r0=353(x), r1=90(y), r2=30(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 90
LDI r2, 30
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

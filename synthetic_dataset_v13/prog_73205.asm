; DESCRIPTION: Creates a blue rectangular region at (72, 37) spanning 50 by 49 pixels.
; PLAN: r0=72(x), r1=37(y), r2=50(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 37
LDI r2, 50
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

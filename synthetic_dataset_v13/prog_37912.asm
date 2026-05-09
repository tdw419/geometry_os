; DESCRIPTION: Creates a blue rectangular region at (450, 72) spanning 15 by 48 pixels.
; PLAN: r0=450(x), r1=72(y), r2=15(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 72
LDI r2, 15
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

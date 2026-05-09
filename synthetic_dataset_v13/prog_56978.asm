; DESCRIPTION: Creates a blue rectangular region at (5, 25) spanning 48 by 71 pixels.
; PLAN: r0=5(x), r1=25(y), r2=48(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 25
LDI r2, 48
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

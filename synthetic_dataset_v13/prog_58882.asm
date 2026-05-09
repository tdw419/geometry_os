; DESCRIPTION: Creates a blue rectangular region at (5, 222) spanning 10 by 32 pixels.
; PLAN: r0=5(x), r1=222(y), r2=10(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 222
LDI r2, 10
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

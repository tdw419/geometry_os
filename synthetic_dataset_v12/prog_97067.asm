; DESCRIPTION: Creates a blue rectangular region at (32, 36) spanning 84 by 120 pixels.
; PLAN: r0=32(x), r1=36(y), r2=84(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 36
LDI r2, 84
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

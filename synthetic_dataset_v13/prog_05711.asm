; DESCRIPTION: Creates a blue rectangular region at (54, 150) spanning 87 by 64 pixels.
; PLAN: r0=54(x), r1=150(y), r2=87(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 150
LDI r2, 87
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

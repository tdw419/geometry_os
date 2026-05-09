; DESCRIPTION: Creates a green rectangular region at (181, 22) spanning 16 by 32 pixels.
; PLAN: r0=181(x), r1=22(y), r2=16(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 22
LDI r2, 16
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

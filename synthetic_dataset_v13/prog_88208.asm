; DESCRIPTION: Creates a green rectangular region at (16, 21) spanning 32 by 13 pixels.
; PLAN: r0=16(x), r1=21(y), r2=32(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 21
LDI r2, 32
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

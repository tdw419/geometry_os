; DESCRIPTION: Creates a green rectangular region at (337, 32) spanning 109 by 24 pixels.
; PLAN: r0=337(x), r1=32(y), r2=109(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 32
LDI r2, 109
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

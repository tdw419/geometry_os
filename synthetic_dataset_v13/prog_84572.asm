; DESCRIPTION: Creates a green rectangular region at (257, 34) spanning 111 by 16 pixels.
; PLAN: r0=257(x), r1=34(y), r2=111(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 34
LDI r2, 111
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

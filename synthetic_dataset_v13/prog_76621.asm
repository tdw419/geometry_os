; DESCRIPTION: Creates a green rectangular region at (257, 133) spanning 28 by 108 pixels.
; PLAN: r0=257(x), r1=133(y), r2=28(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 133
LDI r2, 28
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green 58x21 rectangle at position (396, 147).
; PLAN: r0=396(x), r1=147(y), r2=58(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 147
LDI r2, 58
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

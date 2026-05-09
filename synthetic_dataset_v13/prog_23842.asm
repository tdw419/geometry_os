; DESCRIPTION: Places a green 83x58 rectangle at position (353, 32).
; PLAN: r0=353(x), r1=32(y), r2=83(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 32
LDI r2, 83
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

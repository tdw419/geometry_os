; DESCRIPTION: Places a green 108x108 rectangle at position (83, 68).
; PLAN: r0=83(x), r1=68(y), r2=108(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 68
LDI r2, 108
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

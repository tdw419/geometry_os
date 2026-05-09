; DESCRIPTION: Places a green 108x63 rectangle at position (364, 117).
; PLAN: r0=364(x), r1=117(y), r2=108(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 117
LDI r2, 108
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

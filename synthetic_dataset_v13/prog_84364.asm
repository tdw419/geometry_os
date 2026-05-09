; DESCRIPTION: Places a green 108x90 rectangle at position (139, 68).
; PLAN: r0=139(x), r1=68(y), r2=108(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 68
LDI r2, 108
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

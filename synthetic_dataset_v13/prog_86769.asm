; DESCRIPTION: Places a green 90x15 rectangle at position (318, 68).
; PLAN: r0=318(x), r1=68(y), r2=90(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 68
LDI r2, 90
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

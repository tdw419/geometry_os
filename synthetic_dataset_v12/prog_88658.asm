; DESCRIPTION: Places a green 90x106 rectangle at position (109, 86).
; PLAN: r0=109(x), r1=86(y), r2=90(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 86
LDI r2, 90
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green 101x70 rectangle at position (248, 159).
; PLAN: r0=248(x), r1=159(y), r2=101(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 159
LDI r2, 101
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

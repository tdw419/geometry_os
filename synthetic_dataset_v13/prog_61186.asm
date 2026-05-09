; DESCRIPTION: Places a green 38x65 rectangle at position (354, 158).
; PLAN: r0=354(x), r1=158(y), r2=38(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 158
LDI r2, 38
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

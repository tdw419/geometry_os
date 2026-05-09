; DESCRIPTION: Places a blue 82x12 rectangle at position (314, 86).
; PLAN: r0=314(x), r1=86(y), r2=82(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 86
LDI r2, 82
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

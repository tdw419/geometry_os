; DESCRIPTION: Places a blue 13x64 rectangle at position (188, 170).
; PLAN: r0=188(x), r1=170(y), r2=13(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 170
LDI r2, 13
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

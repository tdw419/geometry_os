; DESCRIPTION: Places a green 13x16 rectangle at position (430, 12).
; PLAN: r0=430(x), r1=12(y), r2=13(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 12
LDI r2, 13
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

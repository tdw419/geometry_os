; DESCRIPTION: Places a cyan 13x117 rectangle at position (496, 40).
; PLAN: r0=496(x), r1=40(y), r2=13(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 40
LDI r2, 13
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

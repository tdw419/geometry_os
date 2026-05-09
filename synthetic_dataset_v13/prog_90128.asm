; DESCRIPTION: Places a green 22x15 rectangle at position (372, 75).
; PLAN: r0=372(x), r1=75(y), r2=22(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 75
LDI r2, 22
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green 91x15 rectangle at position (40, 178).
; PLAN: r0=40(x), r1=178(y), r2=91(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 178
LDI r2, 91
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

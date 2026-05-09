; DESCRIPTION: Places a green 118x11 rectangle at position (178, 187).
; PLAN: r0=178(x), r1=187(y), r2=118(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 187
LDI r2, 118
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

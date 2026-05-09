; DESCRIPTION: Places a green 117x114 rectangle at position (207, 91).
; PLAN: r0=207(x), r1=91(y), r2=117(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 91
LDI r2, 117
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

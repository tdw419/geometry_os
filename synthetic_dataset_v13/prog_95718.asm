; DESCRIPTION: Places a green 97x104 rectangle at position (281, 68).
; PLAN: r0=281(x), r1=68(y), r2=97(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 68
LDI r2, 97
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

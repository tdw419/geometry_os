; DESCRIPTION: Places a green 86x47 rectangle at position (130, 104).
; PLAN: r0=130(x), r1=104(y), r2=86(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 104
LDI r2, 86
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

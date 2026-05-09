; DESCRIPTION: Places a green 104x40 rectangle at position (149, 37).
; PLAN: r0=149(x), r1=37(y), r2=104(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 37
LDI r2, 104
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

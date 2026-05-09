; DESCRIPTION: Places a yellow 37x20 rectangle at position (166, 104).
; PLAN: r0=166(x), r1=104(y), r2=37(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 104
LDI r2, 37
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

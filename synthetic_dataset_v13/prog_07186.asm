; DESCRIPTION: Places a yellow 37x109 rectangle at position (156, 104).
; PLAN: r0=156(x), r1=104(y), r2=37(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 104
LDI r2, 37
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

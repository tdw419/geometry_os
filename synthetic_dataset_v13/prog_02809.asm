; DESCRIPTION: Places a red 104x37 rectangle at position (192, 130).
; PLAN: r0=192(x), r1=130(y), r2=104(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 130
LDI r2, 104
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

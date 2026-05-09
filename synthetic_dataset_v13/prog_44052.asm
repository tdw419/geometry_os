; DESCRIPTION: Places a green 50x37 rectangle at position (364, 141).
; PLAN: r0=364(x), r1=141(y), r2=50(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 141
LDI r2, 50
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

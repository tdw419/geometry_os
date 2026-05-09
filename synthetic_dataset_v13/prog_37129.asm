; DESCRIPTION: Places a green 84x82 rectangle at position (364, 110).
; PLAN: r0=364(x), r1=110(y), r2=84(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 110
LDI r2, 84
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

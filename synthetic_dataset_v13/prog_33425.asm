; DESCRIPTION: Places a cyan 37x113 rectangle at position (192, 104).
; PLAN: r0=192(x), r1=104(y), r2=37(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 104
LDI r2, 37
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

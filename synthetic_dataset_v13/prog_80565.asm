; DESCRIPTION: Places a white 117x37 rectangle at position (339, 192).
; PLAN: r0=339(x), r1=192(y), r2=117(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 192
LDI r2, 117
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

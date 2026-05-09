; DESCRIPTION: Places a cyan 104x30 rectangle at position (349, 110).
; PLAN: r0=349(x), r1=110(y), r2=104(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 110
LDI r2, 104
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

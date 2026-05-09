; DESCRIPTION: Places a cyan 16x103 rectangle at position (104, 122).
; PLAN: r0=104(x), r1=122(y), r2=16(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 122
LDI r2, 16
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

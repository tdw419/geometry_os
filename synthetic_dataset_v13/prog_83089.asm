; DESCRIPTION: Places a cyan 75x81 rectangle at position (104, 103).
; PLAN: r0=104(x), r1=103(y), r2=75(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 103
LDI r2, 75
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

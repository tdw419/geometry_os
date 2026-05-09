; DESCRIPTION: Places a blue 47x16 rectangle at position (344, 195).
; PLAN: r0=344(x), r1=195(y), r2=47(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 195
LDI r2, 47
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

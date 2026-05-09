; DESCRIPTION: Places a blue 45x115 rectangle at position (327, 126).
; PLAN: r0=327(x), r1=126(y), r2=45(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 126
LDI r2, 45
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

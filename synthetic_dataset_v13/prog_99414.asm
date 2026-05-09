; DESCRIPTION: Places a blue 118x45 rectangle at position (362, 16).
; PLAN: r0=362(x), r1=16(y), r2=118(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 16
LDI r2, 118
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

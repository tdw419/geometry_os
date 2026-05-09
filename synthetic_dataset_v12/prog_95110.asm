; DESCRIPTION: Places a blue 118x39 rectangle at position (215, 20).
; PLAN: r0=215(x), r1=20(y), r2=118(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 20
LDI r2, 118
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

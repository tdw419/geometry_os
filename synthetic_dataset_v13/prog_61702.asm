; DESCRIPTION: Places a blue 16x30 rectangle at position (215, 125).
; PLAN: r0=215(x), r1=125(y), r2=16(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 125
LDI r2, 16
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

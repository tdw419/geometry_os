; DESCRIPTION: Places a blue 58x55 rectangle at position (215, 197).
; PLAN: r0=215(x), r1=197(y), r2=58(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 197
LDI r2, 58
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

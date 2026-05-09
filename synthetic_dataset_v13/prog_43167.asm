; DESCRIPTION: Places a blue 112x50 rectangle at position (230, 195).
; PLAN: r0=230(x), r1=195(y), r2=112(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 195
LDI r2, 112
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

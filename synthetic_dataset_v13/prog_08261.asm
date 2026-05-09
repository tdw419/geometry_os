; DESCRIPTION: Places a blue 113x24 rectangle at position (346, 32).
; PLAN: r0=346(x), r1=32(y), r2=113(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 32
LDI r2, 113
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

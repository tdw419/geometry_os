; DESCRIPTION: Places a blue 115x63 rectangle at position (113, 164).
; PLAN: r0=113(x), r1=164(y), r2=115(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 164
LDI r2, 115
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

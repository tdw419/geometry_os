; DESCRIPTION: Places a blue 63x113 rectangle at position (121, 8).
; PLAN: r0=121(x), r1=8(y), r2=63(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 8
LDI r2, 63
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 17x103 rectangle at position (135, 144).
; PLAN: r0=135(x), r1=144(y), r2=17(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 144
LDI r2, 17
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

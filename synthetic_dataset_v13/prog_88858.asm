; DESCRIPTION: Places a blue 112x64 rectangle at position (4, 148).
; PLAN: r0=4(x), r1=148(y), r2=112(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 148
LDI r2, 112
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

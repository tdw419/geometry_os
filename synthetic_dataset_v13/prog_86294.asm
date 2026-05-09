; DESCRIPTION: Places a blue 38x32 rectangle at position (29, 25).
; PLAN: r0=29(x), r1=25(y), r2=38(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 25
LDI r2, 38
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

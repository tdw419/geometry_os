; DESCRIPTION: Places a blue 64x55 rectangle at position (46, 57).
; PLAN: r0=46(x), r1=57(y), r2=64(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 57
LDI r2, 64
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

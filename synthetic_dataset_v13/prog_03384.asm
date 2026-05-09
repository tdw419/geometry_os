; DESCRIPTION: Places a blue 72x29 rectangle at position (160, 184).
; PLAN: r0=160(x), r1=184(y), r2=72(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 184
LDI r2, 72
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

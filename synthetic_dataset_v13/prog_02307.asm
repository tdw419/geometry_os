; DESCRIPTION: Places a blue 112x84 rectangle at position (92, 83).
; PLAN: r0=92(x), r1=83(y), r2=112(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 83
LDI r2, 112
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

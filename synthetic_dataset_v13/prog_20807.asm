; DESCRIPTION: Places a blue 92x24 rectangle at position (288, 135).
; PLAN: r0=288(x), r1=135(y), r2=92(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 135
LDI r2, 92
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

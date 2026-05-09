; DESCRIPTION: Places a blue 38x92 rectangle at position (136, 127).
; PLAN: r0=136(x), r1=127(y), r2=38(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 127
LDI r2, 38
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

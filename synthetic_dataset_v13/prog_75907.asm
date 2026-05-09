; DESCRIPTION: Places a blue 92x93 rectangle at position (240, 48).
; PLAN: r0=240(x), r1=48(y), r2=92(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 48
LDI r2, 92
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

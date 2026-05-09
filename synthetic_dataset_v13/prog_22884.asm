; DESCRIPTION: Places a blue 22x92 rectangle at position (39, 20).
; PLAN: r0=39(x), r1=20(y), r2=22(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 20
LDI r2, 22
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

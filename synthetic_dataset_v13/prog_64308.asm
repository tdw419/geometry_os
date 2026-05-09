; DESCRIPTION: Places a blue 22x11 rectangle at position (173, 118).
; PLAN: r0=173(x), r1=118(y), r2=22(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 118
LDI r2, 22
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

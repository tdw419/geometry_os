; DESCRIPTION: Places a green 24x40 rectangle at position (476, 135).
; PLAN: r0=476(x), r1=135(y), r2=24(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 135
LDI r2, 24
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

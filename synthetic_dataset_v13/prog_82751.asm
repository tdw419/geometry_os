; DESCRIPTION: Places a green 115x36 rectangle at position (163, 209).
; PLAN: r0=163(x), r1=209(y), r2=115(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 209
LDI r2, 115
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

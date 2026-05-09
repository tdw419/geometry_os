; DESCRIPTION: Places a green 105x84 rectangle at position (346, 49).
; PLAN: r0=346(x), r1=49(y), r2=105(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 49
LDI r2, 105
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

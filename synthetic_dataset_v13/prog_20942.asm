; DESCRIPTION: Places a green 64x109 rectangle at position (153, 84).
; PLAN: r0=153(x), r1=84(y), r2=64(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 84
LDI r2, 64
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

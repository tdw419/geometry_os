; DESCRIPTION: Places a green 116x29 rectangle at position (240, 201).
; PLAN: r0=240(x), r1=201(y), r2=116(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 201
LDI r2, 116
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green 10x110 rectangle at position (274, 3).
; PLAN: r0=274(x), r1=3(y), r2=10(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 3
LDI r2, 10
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

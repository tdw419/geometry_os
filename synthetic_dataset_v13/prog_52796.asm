; DESCRIPTION: Places a green 30x112 rectangle at position (200, 90).
; PLAN: r0=200(x), r1=90(y), r2=30(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 90
LDI r2, 30
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

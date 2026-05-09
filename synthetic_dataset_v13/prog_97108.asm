; DESCRIPTION: Places a green 64x20 rectangle at position (312, 60).
; PLAN: r0=312(x), r1=60(y), r2=64(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 60
LDI r2, 64
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

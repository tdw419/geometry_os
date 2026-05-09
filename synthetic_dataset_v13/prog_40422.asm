; DESCRIPTION: Places a magenta 77x20 rectangle at position (329, 128).
; PLAN: r0=329(x), r1=128(y), r2=77(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 128
LDI r2, 77
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

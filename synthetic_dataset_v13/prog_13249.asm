; DESCRIPTION: Places a blue 33x64 rectangle at position (23, 78).
; PLAN: r0=23(x), r1=78(y), r2=33(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 78
LDI r2, 33
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

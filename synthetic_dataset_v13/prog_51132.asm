; DESCRIPTION: Places a blue 106x107 rectangle at position (11, 128).
; PLAN: r0=11(x), r1=128(y), r2=106(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 128
LDI r2, 106
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

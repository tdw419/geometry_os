; DESCRIPTION: Places a green 114x111 rectangle at position (158, 128).
; PLAN: r0=158(x), r1=128(y), r2=114(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 128
LDI r2, 114
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

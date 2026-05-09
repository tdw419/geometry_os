; DESCRIPTION: Places a blue 102x106 rectangle at position (355, 128).
; PLAN: r0=355(x), r1=128(y), r2=102(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 128
LDI r2, 102
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
